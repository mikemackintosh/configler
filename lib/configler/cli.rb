module Configler
  module Cli
  # Event Coders Like To Color...
    def self.success(message)
      puts " #{Paint['[✓]', :bright, :green]} #{Paint[message, :bright, :white]}"
    end
     
    def self.info(message)
      puts " #{Paint['[i]', :bright, :blue]} #{Paint[message, :white]}"
    end

    def self.warning(message)
      puts " #{Paint['[!]', :bright, :orange]} #{Paint[message, :white]}"
      exit!
    end
    
    def self.fatal(message)
      puts " #{Paint['[x]', :bright, :red]} #{Paint[message, :bright, :white]}"
      exit!
    end

  # SEXY AS HELL BANNER
    def self.banner
      puts "#{Paint['
   ______            _____       __
  / ____/___  ____  / __(_)___ _/ /__  _____
 / /   / __ \/ __ \/ /_/ / __ `/ / _ \/ ___/
/ /___/ /_/ / / / / __/ / /_/ / /  __/ /
\____/\____/_/ /_/_/ /_/\__, /_/\___/_/
                       /____/', :white]} by #{Paint['@mikemackintosh', :bright, :green]}\n\n"
    end
  end
end