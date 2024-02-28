module SessionsHelper
  def lecturer?(user)
    temp = SysxUser.find_by(user_id: user.user_id)
    temp.authentication_method_id==3
  end
end
