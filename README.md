# Rails Static Site Template

## Setup

1. Copy `.env.sample` to `.env` and set:
   - SITE_NAME
   - CONTACT_EMAIL
   - SMTP_USER
   - SMTP_PASS
   - SMTP_FROM

2. Run:
   bundle install
   bin/rails s

## Features

- Responsive layout (desktop + mobile)
- Stimulus.js for the menu toggle
- SCSS variables for branding (colors, fonts)
- Working ContactMailer (SMTP)
- Layout sections: hero, about, services, contact
