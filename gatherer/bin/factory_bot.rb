ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/enviroment", __FILE__)
begin
  DatabaseCleaner.start
  FactoryBot.lint(traits: true)
ensure
  DatabaseCleaner.clean
end