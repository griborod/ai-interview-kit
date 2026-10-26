#!/usr/bin/env bash
# Install the kit's skills. Never overwrites existing files.
#   install.sh --project <repo>  skills into <repo>/.claude/skills and <repo>/.agents/skills,
#                                AGENTS.md/CLAUDE.md only if absent; all hidden via .git/info/exclude
#   install.sh --user            skills into ~/.agents/skills, symlinked from ~/.claude/skills
set -euo pipefail

KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() { echo "usage: install.sh --project <repo-dir> | --user" >&2; exit 1; }

copy_skill() { # <src-dir> <dest-parent>
  local name dest
  name="$(basename "$1")"
  dest="$2/$name"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "skip   $dest (exists)"
  else
    mkdir -p "$2"
    cp -R "$1" "$dest"
    echo "copied $dest"
  fi
}

exclude() { # <repo> <relative-path>
  local file="$1/.git/info/exclude"
  [ -d "$1/.git" ] || return 0
  mkdir -p "$1/.git/info"
  touch "$file"
  grep -qxF "$2" "$file" || echo "$2" >> "$file"
}

[ $# -ge 1 ] || usage

case "$1" in
  --project)
    [ $# -eq 2 ] || usage
    ROOT="$(cd "$2" && pwd)"
    for s in "$KIT"/skills/*/; do
      copy_skill "${s%/}" "$ROOT/.claude/skills"
      copy_skill "${s%/}" "$ROOT/.agents/skills"
      exclude "$ROOT" ".claude/skills/$(basename "$s")/"
      exclude "$ROOT" ".agents/skills/$(basename "$s")/"
    done
    for t in AGENTS.md CLAUDE.md; do
      if [ -e "$ROOT/$t" ]; then
        echo "skip   $ROOT/$t (repo has its own)"
      else
        cp "$KIT/templates/$t" "$ROOT/$t"
        exclude "$ROOT" "/$t"
        echo "copied $ROOT/$t"
      fi
    done
    echo "done. Kit files are listed in .git/info/exclude and won't show in git status."
    ;;
  --user)
    [ $# -eq 1 ] || usage
    for s in "$KIT"/skills/*/; do
      name="$(basename "$s")"
      copy_skill "${s%/}" "$HOME/.agents/skills"
      link="$HOME/.claude/skills/$name"
      if [ -e "$link" ] || [ -L "$link" ]; then
        echo "skip   $link (exists)"
      else
        mkdir -p "$HOME/.claude/skills"
        ln -s "$HOME/.agents/skills/$name" "$link"
        echo "linked $link"
      fi
    done
    echo "done. Start a new agent session to pick up the skills."
    ;;
  *) usage ;;
esac
