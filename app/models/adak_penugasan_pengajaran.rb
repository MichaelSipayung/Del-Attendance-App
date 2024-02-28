# frozen_string_literal: true

class AdakPenugasanPengajaran < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'adak_penugasan_pengajaran'
  self.primary_key = 'penugasan_pengajaran_id'
end
