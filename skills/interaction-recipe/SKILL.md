---
name: interaction-recipe
description: 'Turn a website interaction or effect into a shareable recipe: a short recording as a GIF, the story of how it works and what went wrong, the exact prompt to rebuild it, and a single file live demo. Use when someone wants to document, share, open source or post about an interaction, animation or effect from their site.'
---

# Interaction recipe

The useful part of an interaction isn't the code, it's the decisions. A recipe carries both: what it does, what went wrong on the way, and a prompt that rebuilds it with those decisions baked in.

## Steps

1. **Find the real implementation.** Read the code on the site. Every number in the write up (radius, timing, decay, columns) comes from the code, never from memory.
2. **Record it.** A screen recording of 10 to 30 seconds. Turn it into a GIF GitHub will show, for example:
   `ffmpeg -i clip.mp4 -vf "setpts=PTS/1.6,fps=12,scale=640:-1:flags=lanczos,split[a][b];[a]palettegen=max_colors=128:stats_mode=diff[p];[b][p]paletteuse=dither=bayer:bayer_scale=4" demo.gif`
   Aim for under 5 MB.
3. **Scan it for private details** with the privacy-scan skill before anything is published. Old recordings often show an email address in a footer or an autofill popup.
4. **Write the story,** in the person's own voice: what it does in one line, the single rule that makes it work, and what went wrong before it did (the fix nobody would guess).
5. **Write the prompt.** One paragraph a person can paste into any AI coding tool, specific enough to rebuild the effect: the structure, the numbers, the edge cases that were fixed, and reduced motion.
6. **Build a single file demo** (`index.html`, no libraries) when the effect can stand alone. Add a `?demo` or `?at=` option that freezes a good pose, so a screenshot shows the effect.
7. **Check it** in a real browser: the interaction, a phone width, reduced motion, light and dark.

## Output

A folder with `README.md` (title, GIF, story, "Use it on your site", the prompt in a text block, license), `index.html` if there's a demo, and `assets/`. Every claim in the README matches the code.
