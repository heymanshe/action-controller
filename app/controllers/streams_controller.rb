class StreamsController < ApplicationController
  include ActionController::Live

  def index
  end

  def live
    response.headers["Content-Type"] = "text/event-stream"

    10.times do |i|
      response.stream.write "data: Message #{i + 1} at #{Time.now}\n\n"
      sleep 1
    end
  ensure
    response.stream.close
  end
end
