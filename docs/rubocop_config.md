# Database Sample Setup

This config allows to server to start the development DB, test DB when working on local.
It also allows Github to connect to the test DB when running the Github Actions to test.

## Use
- Simply copy-paste this file in the project root folder
- Make sure rubocop gem is installed
- Check for any changes on rules

```
require:
  - rubocop-rspec
  - rubocop-rails

AllCops:
  NewCops: enable
  Exclude:
    - 'Gemfile'
    - '**/bin/**/*'
    - '**/config/**/*'
    - '**/db/**/*'
    - 'vendor/**/*'
    - 'tmp/**/*'

Style/Documentation:
  Enabled: false
```