# ai-interview-kit

Маленький переносимый набор скиллов для часовой сессии совместной разработки
с AI-агентом. Формат `SKILL.md` (frontmatter `name` + `description`) понимают
Claude Code, Codex и Cursor.

Процесс: **спека → план → реализация → проверка → независимое ревью**.

| Скилл | Когда срабатывает |
|---|---|
| `task-spec` | Старт задачи: до 3 вопросов, `TASK.md` с критериями приёмки и командами проверки |
| `tdd-lite` | Логика с чёткими входами/выходами, баг-фиксы; не для glue-кода и UI |
| `debug-loop` | Ошибка или падающий тест: воспроизвести → гипотеза → одно изменение |
| `parallel-agents` | Независимые части: фоновый поиск, тесты под интерфейс, worktrees |
| `verify-done` | Перед словом «готово»: свежие доказательства по каждому критерию |
| `review-diff` | Свежий субагент проверяет diff против `TASK.md` + чеклист типовых ошибок агентов |
| `karpathy-coder` | Допущения, простота, хирургические правки, проверяемые цели |

## Файлы

- `install.sh` — установка; ничего не перезаписывает.
  - `--project <repo>` — в `<repo>/.claude/skills` и `<repo>/.agents/skills`,
    шаблоны `AGENTS.md`/`CLAUDE.md` только если их нет; всё прячется через
    `.git/info/exclude`, поэтому в чужой репозиторий не попадает.
  - `--user` — в `~/.agents/skills` с symlink из `~/.claude/skills`.
- `interview-mode.sh on|off|status` — временно прячет шумные скиллы (Cursor-only,
  тяжёлые процессные, заменённые этим набором) из `~/.claude/skills`. Двигает
  только symlink'и, Codex и Cursor не затрагивает.
- `templates/AGENTS.md` — короткие правила для репозитория задачи;
  `templates/CLAUDE.md` импортирует его (`@AGENTS.md`).
- `PROMPTS.md` — промпты для трёх случаев: своё окружение, чужое со скиллами,
  без скиллов.

## Источники

- `karpathy-coder` — копия стороннего скилла (MIT, author `claude-code-skills`),
  без изменений.
- Остальные скиллы написаны для этого набора; идеи взяты из
  [obra/superpowers](https://github.com/obra/superpowers) (TDD, debugging,
  verification) и [mattpocock/skills](https://github.com/mattpocock/skills), но
  сокращены и смягчены под формат одного часа.
