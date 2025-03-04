class AdminsController < ApplicationController
  USERS = { "admin" => "helloworld" }

  before_action :authenticate

  def index
    render plain: "You have successfully logged in as admin!"
  end

  private
    def authenticate
      authenticate_or_request_with_http_digest do |name|
        USERS[name]
      end
    end
end
