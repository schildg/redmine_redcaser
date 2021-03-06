# Code coverage setup.
require 'simplecov'

plugin_name           = 'redmine_redcaser'
plugin_directory      = File.expand_path('../../', __FILE__)
plugin_test_directory = File.join(plugin_directory, 'test')
plugin_factories      = File.join(plugin_test_directory, 'factories')

SimpleCov.start 'rails' do
  add_group    'Libraries', 'lib'
  add_group    'Hooks', "lib/#{ plugin_name }/hooks"
  add_group    'Patches', "lib/#{ plugin_name }/patches"
  add_filter   '/spec/'
  add_filter   '/test/'
  add_filter   'init.rb'
  coverage_dir File.join(plugin_directory, 'tmp', 'coverage')
  root         plugin_directory
end

# Run coveralls only on travis.
if ENV.fetch('TRAVIS', false)
  require 'coveralls'

  Coveralls.wear!
end

# Redmine test helper.
require_relative '../../../test/test_helper.rb'

# Including support modules.
Dir.glob(File.join(plugin_test_directory, '/support/**/*.rb')).each do |file|
  require file
end

# Load factories.
FactoryGirl.definition_file_paths << plugin_factories
FactoryGirl.find_definitions

# Include `factory gril` methods.
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

# Show the entire stack trace on error (a real life saver!).
Rails.backtrace_cleaner.remove_silencers!
