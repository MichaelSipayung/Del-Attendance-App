module SessionsHelper
  def lecturer?(user)
    temp = SysxUser.find_by(user_id: user.user_id)
    temp.authentication_method_id==3
  end

  def current_pegawai(hrdx_pegawai)
    @current_pegawai = hrdx_pegawai
  end
end
