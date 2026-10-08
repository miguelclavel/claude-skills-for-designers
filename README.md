# Claude skills for designers

Four Claude Code skills for product design work, built from my own [playbook](https://github.com/miguelclavel/product-design-playbook), [prompts](https://github.com/miguelclavel/ai-prompts-for-designers) and checklists. Install one and Claude knows how to do that job the way I'd do it: grounded in what it can actually see, honest about what it can't, and specific about the fix.

By [Miguel Clavel](https://github.com/miguelclavel), Senior Product Designer. I build with Claude Code: my [chat portfolio](https://github.com/miguelclavel/chat-portfolio), [miguelclavel.com](https://github.com/miguelclavel/miguelclavel.com) and everything in this GitHub.

| Skill | What it does | Say something like |
| --- | --- | --- |
| [design-review](skills/design-review/SKILL.md) | Heuristic and WCAG 2.2 AA review of a screen, flow or page, ranked by severity, with specific fixes | "Review this checkout screen" |
| [ai-output-review](skills/ai-output-review/SKILL.md) | Finds the quiet failures in AI written work: numbers, specifics, tone, claims, gaps | "Fact check this research summary before I send it" |
| [case-study-short-version](skills/case-study-short-version/SKILL.md) | Writes the 30 second version of a case study from your notes, without inventing results | "Give me the short version of this project" |
| [launch-check](skills/launch-check/SKILL.md) | Checks a site for security, search, accessibility, speed and after launch basics, with evidence | "Is my portfolio ready to launch?" |

## Install

Copy any skill folder into `~/.claude/skills/` to use it everywhere, or into `.claude/skills/` inside one project:

```bash
git clone https://github.com/miguelclavel/claude-skills-for-designers
cp -R claude-skills-for-designers/skills/design-review ~/.claude/skills/
```

Claude picks a skill up on its own when your request matches its description, or you can ask for it by name.

## What makes a skill good

1. **A description that says when.** Claude decides whether to use a skill from its description, so it lists the words people actually use: "review", "critique", "is my site ready".
2. **Steps, not vibes.** "Check contrast, focus order and target size" beats "make it accessible".
3. **Permission to say "I can't tell".** Every skill here separates what it verified from what needs confirming by hand.
4. **A fixed output.** Tables and numbered fixes are easier to act on and harder to pad.
5. **A list of don'ts.** The mistakes are as important as the steps: don't invent behaviour, don't round numbers up, don't mark anything as passing without evidence.

## Related

- [AI UX patterns](https://github.com/miguelclavel/ai-ux-patterns): seven interface patterns for AI products people can trust
- [AI prompts for product designers](https://github.com/miguelclavel/ai-prompts-for-designers): the same ideas as copy and paste prompts, for any AI tool
- [Product design playbook](https://github.com/miguelclavel/product-design-playbook): the process these skills come from

---

MIT licensed. Made by [Miguel Clavel](https://miguelclavel.com/?utm_source=github&utm_medium=claude-skills) with Claude Code.
