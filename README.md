# Ericksons Admin Interface

This project is a Ruby on Rails application with a custom WordPress-like admin interface for managing articles, testimonials, services, and more. It utilizes Tailwind CSS for styling and Active Storage for file uploads.

## Table of Contents

- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Features](#features)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## Installation

### Prerequisites

Ensure you have the following installed:

- Ruby (version 3.0.0 or newer)
- Rails (version 7.0 or newer)
- PostgreSQL
- Node.js and Yarn
- Redis (for ActiveJob)

### Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Seggellion/ericksons.git
   cd ericksons
   ```
   
2. Install dependencies:

```bash
bundle install
yarn install
```

3. Set up the database:

```bash
rails db:create
rails db:migrate
```

3.5. Start the database:

```
service postgresql start
```

4. Install Active Storage:

```bash
rails active_storage:install
rails db:migrate
```

5. Start the server:

```bash
rails server
```

6. Access the application:

Open your browser and go to http://localhost:3000.

## Configuration
Tailwind CSS
Tailwind CSS is used for styling. The configuration is in tailwind.config.js. To compile Tailwind CSS, run:

```bash
npx tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/stylesheets/application.css --watch
```

### Importing Custom Fonts
Add your custom fonts (e.g., Alegreya) to the app/assets/fonts/alegreya directory and configure them in app/assets/stylesheets/fonts.css.

### Active Storage
Active Storage is used for file uploads. Ensure you have a storage service configured in config/storage.yml.

### Turbo
Turbo is enabled for enhanced user experience. Ensure it is properly set up in app/javascript/packs/application.js.

## Usage

### Admin Interface
The admin interface allows you to manage various content types:

- Articles
- Testimonials
- Services

To access the admin interface, go to /admin.

### Managing Services
You can create, edit, update, and delete services. Each service can have a title, rich text content, featured image, and categories.

### Managing Articles and Testimonials
Similar to services, you can manage articles and testimonials with rich text content and categories.

### Viewing Current Images
When editing a service, the currently assigned image (if any) is displayed above the image upload form.

### Features
- Custom Admin Interface: A WordPress-like admin interface built with Tailwind CSS.
- Rich Text Editing: Using Action Text (Trix) for content management.
- File Uploads: Manage images with Active Storage.
- Turbo Integration: Enhanced user experience with Turbo.
- Custom Fonts: Integrate and use custom fonts.

## Deployment

1. Deploying to Heroku
Create a new Heroku application:

```bash
heroku create
```

2. Set up the Heroku environment variables:

```bash
heroku config:set RAILS_ENV=production
```

3. Deploy the application:

```bash
git push heroku main
```

4. Run database migrations on Heroku:

```bash
heroku run rails db:migrate
```

License

This project is licensed under the MIT License. See the LICENSE file for details.
