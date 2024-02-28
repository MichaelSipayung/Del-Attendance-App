# frozen_string_literal: true

class AdakPengajaran < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'adak_pengajaran'
  self.primary_key = 'pengajaran_id'
end
