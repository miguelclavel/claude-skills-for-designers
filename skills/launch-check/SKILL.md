---
name: launch-check
description: 'Run a pre launch check on a website for security, search, accessibility, speed and after launch basics, and report what passes and what to fix. Use before launching or relaunching a site, after a big change, or when someone asks "is my site ready", "check my site" or "audit my portfolio".'
---

# Launch check

Check a site the way a careful launch would, and report every item as pass, fix, or not applicable, with the evidence. Work from the live URL, the project folder, or both.

## Security

- Secrets: search the code and the git history for keys and tokens (`git log -p` for patterns like `sk-`, `ghp_`, `AKIA`, `token`, `secret`). Check the published files too.
- Only the site is published: request `/.git/config`, `/.env` and any config files; each should return 404.
- HTTPS: plain `http://` should redirect. Read the response headers (`curl -sI`) for Content-Security-Policy, Strict-Transport-Security, X-Frame-Options, X-Content-Type-Options and Referrer-Policy.
- Forms and endpoints check what they receive; there's a one step rollback.

## Search, for Google and AI assistants

- One unique `<title>` per page, under about 60 characters. One unique meta description, under about 160.
- Canonical links set; private pages marked `noindex`.
- A share image (`og:image`) on important pages, structured data for the person or organisation, and a plain text `/llms.txt`.

## Accessibility

- Contrast passes WCAG AA in every theme, every action works with a keyboard, focus is visible, images have alt text, it reflows at 320 pixels, and motion respects reduced motion. Test what you can; mark the rest "to confirm by hand".

## Speed

- Images sized for where they're shown and lazy loaded below the first screen.
- Caching won't freeze old code in visitors' browsers: new code gets new file names, or HTML has a short cache time.

## After launch

- Analytics works and excludes the owner's visits; there's a way to hear what people couldn't find (a log, a form, a weekly review), and someone owns looking at it.

## Output

One table per section: | Check | Status | Evidence |. Status is Pass, Fix or Not applicable. Then the fixes as a numbered list, most important first. Never mark something as passing without evidence.
