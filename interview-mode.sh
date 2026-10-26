#!/usr/bin/env bash
# Temporarily hide noisy skills from Claude Code for the interview.
#   interview-mode.sh on      move listed symlinks out of ~/.claude/skills
#   interview-mode.sh off     put them back
#   interview-mode.sh status  show what is hidden
# Only symlinks are moved; the skills themselves in ~/.agents/skills stay untouched,
# so Codex and Cursor are not affected.
set -euo pipefail
shopt -s nullglob

SKILLS="$HOME/.claude/skills"
OFF="$HOME/.claude/skills-interview-off"

# Cursor-only tooling, heavy process skills, and skills replaced by this kit.
HIDE=(
  'bdk-*' origin new-repo share env-setup migrate-to-builds migrate-to-skills
  update-cursor-settings update-cli-config sdk canvas autopilot subscribe automate
  review-bugbot review-security create-rule create-hook create-skill create-subagent
  walkthrough-artifacts artifact-template-system-design onboard rename-chat shell
  statusline goal split-to-prs find-skills writing-skills
  using-superpowers brainstorming writing-plans executing-plans
  subagent-driven-development finishing-a-development-branch dispatching-parallel-agents
  requesting-code-review receiving-code-review deliberation-debate-red-teaming
  test-driven-development systematic-debugging verification-before-completion
  caveman
)

case "${1:-}" in
  on)
    mkdir -p "$OFF"
    for pat in "${HIDE[@]}"; do
      for p in "$SKILLS"/$pat; do
        [ -L "$p" ] || continue
        mv "$p" "$OFF/"
        echo "hidden   $(basename "$p")"
      done
    done
    echo "done. Start a new Claude Code session. Undo: $0 off"
    ;;
  off)
    [ -d "$OFF" ] || { echo "nothing hidden"; exit 0; }
    for p in "$OFF"/*; do
      name="$(basename "$p")"
      if [ -e "$SKILLS/$name" ] || [ -L "$SKILLS/$name" ]; then
        echo "skip     $name (already in $SKILLS)"
      else
        mv "$p" "$SKILLS/"
        echo "restored $name"
      fi
    done
    rmdir "$OFF" 2>/dev/null || echo "left in $OFF: $(ls "$OFF" | tr '\n' ' ')"
    ;;
  status)
    if [ -d "$OFF" ]; then
      echo "hidden: $(ls "$OFF" | tr '\n' ' ')"
    else
      echo "nothing hidden"
    fi
    ;;
  *) echo "usage: $0 on|off|status" >&2; exit 1 ;;
esac
