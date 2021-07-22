class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to homes_path, notice: "#{user.name}ユーザー、所属「#{user.department}」としてログインしました。"
  end

  def admin_guest_sign_in
    admin_user = User.admin_guest
    sign_in admin_user
    redirect_to homes_path, notice: "#{admin_user.name}ユーザー、所属「#{admin_user.department}」としてログインしました。"
  end
end