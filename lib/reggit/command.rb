module Reggit
  class Command
    def self.load
      Dir[File.join(File.dirname(__FILE__), "commands", "*.rb")].each do |file|
        require file
      end
    end

    def self.run(*args)
      instance = self.new
      instance.process_command(args)
      return instance
    end
  end
end
