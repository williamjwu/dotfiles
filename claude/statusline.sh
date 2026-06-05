#!/usr/bin/env bash
# Claude Code status line.
# Shows:  ✻ model:effort  ·  ctx <context-window %>  ·  5h/7d <usage limits>
#
# Reads the session JSON on stdin (schema: https://code.claude.com/docs/en/statusline).
# Colors use 256-color codes tuned to Claude's warm "clay" palette for a dark terminal.

input=$(cat)

# --- palette (256-color; warm Claude tones, degrade gracefully on any xterm-256color) ---
ESC=$'\033'
CLAY="${ESC}[38;5;173m"    # #d7875f — Claude clay/orange, brand accent (closest 256 to #D97757)
PEACH="${ESC}[38;5;180m"   # #d7af87 — soft secondary
DIM="${ESC}[38;5;244m"     # #808080 — labels & separators
OK="${ESC}[38;5;114m"      # #87d787 — low usage
WARN="${ESC}[38;5;179m"    # #d7af5f — amber, filling up
DANGER="${ESC}[38;5;167m"  # #d75f5f — muted red, nearly full
RESET="${ESC}[0m"
SEP="${DIM}  ·  ${RESET}"

# Pick a color for an integer percentage (green < 70, amber 70-89, red >= 90).
pct_color() {
  if   [ "$1" -ge 90 ]; then printf '%s' "$DANGER"
  elif [ "$1" -ge 70 ]; then printf '%s' "$WARN"
  else                       printf '%s' "$OK"
  fi
}

# --- model : effort ---
MODEL=$(printf '%s' "$input" | jq -r '.model.display_name // "Claude"')
EFFORT=$(printf '%s' "$input" | jq -r '.effort.level // empty')   # absent on models w/o effort
if [ -n "$EFFORT" ]; then
  MODEL_SEG="${CLAY}✻ ${MODEL}${DIM}:${PEACH}${EFFORT}${RESET}"
else
  MODEL_SEG="${CLAY}✻ ${MODEL}${RESET}"
fi

# --- context window percentage (null early in a session -> 0) ---
CTX=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
CTX_SEG="${DIM}ctx ${RESET}$(pct_color "$CTX")${CTX}%${RESET}"

# --- usage limits (Claude.ai Pro/Max only; whole object/window may be absent) ---
FIVE=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
WEEK=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
LIMIT_SEG=""
if [ -n "$FIVE" ]; then
  f=$(printf '%.0f' "$FIVE")
  LIMIT_SEG="${DIM}5h ${RESET}$(pct_color "$f")${f}%${RESET}"
fi
if [ -n "$WEEK" ]; then
  w=$(printf '%.0f' "$WEEK")
  [ -n "$LIMIT_SEG" ] && LIMIT_SEG="${LIMIT_SEG}${DIM} · ${RESET}"
  LIMIT_SEG="${LIMIT_SEG}${DIM}7d ${RESET}$(pct_color "$w")${w}%${RESET}"
fi

# --- assemble (escape bytes are literal already, so plain %s) ---
line="${MODEL_SEG}${SEP}${CTX_SEG}"
[ -n "$LIMIT_SEG" ] && line="${line}${SEP}${LIMIT_SEG}"
printf '%s\n' "$line"
