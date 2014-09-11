#!/usr/bin/env ruby

require 'rake'
require 'rake/tasklib'

module DTITools
  module Rake
    class TestTask < ::Rake::TaskLib
      def initialize

        namespace :test do
          desc 'Runs acceptance and unit tests'
          task :all => [:units, :acceptance]

          desc 'Runs the unit tests'
          task :units do
            unit_tests_command = "bundle exec rspec spec"

            puts "Running the unit tests with \"#{unit_tests_command}\"\n\n"
            system unit_tests_command
          end

          desc 'Runs the acceptance tests'
          task :acceptance, [:feature] do |t, args|
            if args.feature.nil?
              acceptance_tests_command = "bundle exec cucumber"
            else
              acceptance_tests_command = "bundle exec cucumber #{args.feature} features/step_definitions/ features/support/"
            end

            puts "Running the acceptance tests with \"#{acceptance_tests_command}\"\n\n"
            system acceptance_tests_command
          end
        end
      end
    end
  end
end

