acceptance-setup:
  bundle exec rake spec_prep
  bundle exec rake 'litmus:provision_list[default]'
  bundle exec rake 'litmus:install_agent'
  bundle exec rake 'litmus:install_module'

acceptance:
  bundle exec rake spec_prep
  bundle exec rake 'litmus:install_modules_from_directory[./spec/fixtures/modules]'
  bundle exec rake litmus:acceptance:parallel

acceptance-tear-down:
  bundle exec rake litmus:tear_down

test:
  bundle exec rake spec

fmt:
  pre-commit
