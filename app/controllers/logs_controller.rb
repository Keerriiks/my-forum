class LogsController < ApplicationController
  def index
   @logs = IO.read(Rails.root.join('log', 'development.log'))
  end
end
