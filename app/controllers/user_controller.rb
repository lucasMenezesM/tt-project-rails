class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts "=============== CREATE FUNCTION ACTIVATED ==================="
    puts params
  end
end
