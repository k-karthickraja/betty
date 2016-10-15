# Understanding the framework with the 

module Daybook 
  def self.has_command?(command)
    response = `which #{ command }`
    response != ""
  end

  def self.interpret(command)
    responses = []
    
    # Here xox is a shell script to open representation for my timesheet. 
    if command.match(/^xox/i) || command.match(/^show\sme\s(my)?\sxox$/i) or command.match(/^open\s(my)?xox\??$/i)
	responses << {
        :command => "xox -e cat",
        :explanation => "Opening your xox file...."
      }
   end

    if command.match(/^show\s(my)?\s?xox$/i) 
#	puts "#{day_string} from the command I received" 
	responses << { 
		:command => "xox -e tail" ,
		:explanation => "I can open current day timesheet only..."
	}
   end 

    responses
  end

  def self.help
    commands = []
    commands << {
      :category => "Daybook",
      :description => 'Show the timesheet files',
      :usage => ["show me my xox",
      "open my xox",
      "show my xox"] 
    }
    commands
  end
end

$executors << Daybook 
