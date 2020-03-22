# frozen_string_literal: true

module Lucca
  # Command-line interface, based on Thor (http://whatisthor.com/)
  class Cli < Thor
    COMMANDS = {
      commands: 'Lists commands available in Lucca',
      init: 'Create a Lucca configuration file in the current directory',
      report: 'Generate worklog report',
      start: 'Start a timer',
      stop: 'Stop the currently started timer'
    }.freeze

    desc 'commands', COMMANDS[:commands]
    def commands
      out = COMMANDS.map do |command, description|
        "#{command}: #{description}"
      end.join("\n")
      say out
    end

    # Init should create a .lucca.yml file in the current directory (or in
    # the root of the current git repo) that will define the following:
    # - Project name (can be based on git repo)
    # - Project tags, used for stats later
    # - Is the project billable?
    # - Hourly rate
    # - Currency
    # - Should a pomodoro timer automatically start?
    desc 'init', COMMANDS[:init]
    def init
      say('Creating a configuration file')
    end

    # Report generates data based on accumulated logs. Exact behviour is TBD but
    # it should be able to generate separate date per project, per discrete
    # year/month/week/day, per tag, etc.
    # Should also support different output formats, and support plugins for
    # adding more formats, which will be useful to generate for example CSV
    # files for upload to FreeAgent
    desc 'report', COMMANDS[:report]
    def report
      say('Generating report')
    end

    # Should start a timer.
    # Check for the presence of .lucca.yml in current directory (or git
    # project) to set default options. Can be overriden with:
    # --project to override the project name
    # --tags for additional tags
    # --pomodoro to start a pomodoro timer
    # --at to override the starting time
    desc 'start', COMMANDS[:start]
    def start
      say('Starting timer', :green)
    end

    # Stops the current timer
    # --at to override the ending time
    desc 'stop', COMMANDS[:stop]
    def stop
      say('Stopping timer', :red)
    end
  end
end
