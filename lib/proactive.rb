#Module to perform the actions for the pro-active

# Scope :
#   Need to add all compatablity for health check  viewer...
#   * Checking central server health check file status.
#   * Failure status.
#
require_relative 'proactive_reporter.rb'
module Proactive
  def self.interpret(command)
    responses = []

    # Here xox is a shell script to open representation for my timesheet.
    if command.match(/^send\stoday(')?(s)?\shc\sreport$/i) or command.match(/send\stoday(')?(s)?\shealth(\s)?check\sreport$/i)
      responses << {
      :call => ProactiveReporter.new,
      :explanation => "To initiate the hrs to send todays hc report"
      }
    end

    if command.match(/^send\syesterday(')?(s)?\shc\sreport/i)
      #	puts "#{day_string} from the command I received"
		  ProactiveReporter.days_before=1
	    responses << {
		  :call => ProactiveReporter.new,
		  :explanation => "To initiate the hrs to send yesterdays hc report"
	    }
    end
    responses
  end

  def self.help
    commands = []
    commands << {
      :category => "Proactive",
      :description => 'commands to perform the jobs related to proactive',
      :usage => ["Send todays hc report",
      "Send yesterdays hc report",
      "Send today healthcheck report"]
    }
    commands
  end
end

$executors << Proactive
