# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "cucumber/rake/task"

RSpec::Core::RakeTask.new(:spec)

desc "Default: run the specs, features, and standard ."
task default: %w[spec features]

Cucumber::Rake::Task.new(:features) do |t|
  t.fork = true
  t.cucumber_opts = ["--format", (ENV["CUCUMBER_FORMAT"] || "progress")]
end
