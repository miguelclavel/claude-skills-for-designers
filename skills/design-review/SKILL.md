---
name: design-review
description: 'Review a screen, flow or page for usability and accessibility problems and return a ranked list of fixes. Use when someone shares a screenshot, a URL or a design and asks for a review, a critique, a heuristic evaluation, an accessibility check, or "what''s wrong with this".'
---

# Design review

Give a review a designer can act on today: what's wrong, how bad it is, and the specific fix. Only report what you can actually see or test.

## Before you start

Ask, or infer from context, three things: who uses this, what they're trying to do, and on what device. If you can't tell, say what you assumed.

## Steps

1. **Usability.** Check the screen against Nielsen's ten heuristics. For each issue note the exact element, the heuristic, and how often it would bite and how much it blocks the goal.
2. **Accessibility.** Check WCAG 2.2 AA: text and non text contrast, colour as the only signal, target size, focus order and visible focus, form labels and errors, headings and structure, alt text, reflow at 320 pixels, motion. If you have the live page or code, test it (contrast values, keyboard path, zoom to 400%). If you only have an image, mark anything you can't verify as "to confirm".
3. **Every state.** Look for empty, loading, error and success states and honest confirmations (a mail link should say the email app should open, not "sent"). Missing states are findings.
4. **What works.** Note up to three things to keep, so the fixes don't break them.

## Output

A table, ordered by severity, limited to the ten most important issues:

| Severity | Element | Problem | Heuristic or WCAG | Fix |
| --- | --- | --- | --- | --- |

Then "Keep", then "To confirm in the real product". Severity is high, medium or low, judged by frequency and impact, never by taste. Every fix is specific: a colour value, a label, a size, a sentence of copy.

## Don't

- Don't invent behaviour you can't see (what happens after a tap) and report it as fact.
- Don't pad the list. Ten real issues beat thirty small ones.
- Don't mark anything as passing that you didn't verify.
