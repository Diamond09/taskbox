class SayController < ApplicationController
  def hello
  	@clients = Client.all
  end
  def goodbye
  end
  def data
  	@clients = Client.all
  	@projects = Project.all
  end
end
