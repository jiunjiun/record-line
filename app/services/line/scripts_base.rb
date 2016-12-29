module Line
  class ScriptsBase < Base
    prepend Line::Scripts::HelpScript
    prepend Line::Scripts::ShowScript
    prepend Line::Scripts::RecordScript

    attr_reader :event

    def self.assign event
      new(event).assign
    end

    def initialize event
      @event = event
    end

    def assign
    end
  end
end
