class HrdxPegawaisController < ApplicationController
  def show
    @pegawai = HrdxPegawai.find_by(pegawai_id: params[:id])
    @courses = @pegawai.my_courses
  end
end
