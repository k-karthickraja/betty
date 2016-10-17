module Brief
        def self.interpret(command)
                responses=[]
                if command.match(/brief/)
                        if command.match(/today/)
                                puts "Welcome to start your day"
                                puts "#{Time.now}"
                        end
                end
                responses
        end

        def self.help
                commands = []
                commands << {
      :category => "brief",
      :description => 'Find file \033[34mSizes\033[0m',
      :usage => ["brief today"]
    }
    commands
        end
end
#puts $executors
$executors << Brief
