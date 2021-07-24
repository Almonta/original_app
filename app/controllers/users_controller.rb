class UsersController < ApplicationController
  def show
    @user = current_user
    # binding.irb
  end
end
