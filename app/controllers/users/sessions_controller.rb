class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to homes_index_path, notice: "#{user.name}ユーザー、所属「#{user.department}」としてログインしました。"
  end
end