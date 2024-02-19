# frozen_string_literal: true

class Controller
  def initialize(queue)
    @queue = queue
  end

  def process_input(events_map)
    @queue << events_map[$stdin.gets.chomp]
  end
end
