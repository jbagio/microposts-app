class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: 'this is not the app you\'re looking for'
  end
end
