# [excid3.com](https://excid3.com)

This is Chris Oliver's personal blog. It's really old and built with Jekyll.

## Usage

```bash
bundle install
bundle exec jekyll serve
```

## Deploying

The site is hosted on Cloudflare Pages and deploys automatically on every push to `master`.

Cloudflare Pages settings:

- Build command: `bundle exec jekyll build`
- Build output directory: `_site`
- Ruby version: pinned by `.ruby-version`

Redirects for legacy URLs live in `_redirects`.
