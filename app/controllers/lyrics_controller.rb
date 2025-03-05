class LyricsController < ActionController::Base
  include ActionController::Live

  def show
    response.headers["Content-Type"] = "text/event-stream"
    response.headers["Cache-Control"] = "no-cache"

    song = Song.find(params[:id])

    song.lyrics.split("\n").each do |line|
      response.stream.write "#{line}\n"
      sleep song.num_beats
    end
  ensure
    response.stream.close
  end
end
