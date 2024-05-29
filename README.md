# Ruby on Rails & Postgres (ruby-rails-postgres)

This is a personal clean initial setup for template [Ruby on Rails & Postgresql](https://github.com/devcontainers/templates/tree/main/src/ruby-rails-postgres).

The idea for this repo is to keep this up-to-date with my personal customizations like:
 - New services
 - VS Code plugins
 - Custom configurations
   - Maybe adding node for front-end development

 ## Starting a new project
 This repo will not be used as a template to start new project, it is used to keep tracking personal configuration added while I learn.

 To start a new project:
  - Open VSCode (Locally) or start a new blank template Codespace
  - Using the VSCode DevContainer wizard (This guide: [Using Predefined Dev Container](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/introduction-to-dev-containers#using-a-predefined-dev-container-configuration))
    - Use `Shift + Command + P`
    - Type `"add dev"`. Click Codespaces: `Add Dev Container Configuration Files`
    - Select `Create a new configuration`
    - Search for `Ruby on Rails & Postgres` template
    - For the moment, do no add new features.
    - Restart the container (VSCode message will pop-up)
 - After restarting create a new repo and push initial commit.
 - Modify files on `.devcontainer` with the custom configuration from this repo into new project.
 - Commit & Push new changes.
 - Create a new Rails Project & Happy Coding

 ## References:
   - DevContainer Images List: https://containers.dev/templates
   - Ruby on Rails & Postgres Image: https://github.com/devcontainers/templates/tree/main/src/ruby-rails-postgres
   - Intro to DevContainers: https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/introduction-to-dev-containers

## Helpful Commands
 - Create a new rails app in current folder with postgresql as DB and Tailwind as css: `rails new . --database=postgresql --css=tailwind`

## Sample Configuration
- [Database Sample Config](docs/db_setup.md)
- [Rubocop Sample Config](docs/rubocop_config.md)