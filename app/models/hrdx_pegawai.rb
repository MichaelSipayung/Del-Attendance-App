# frozen_string_literal: true

class HrdxPegawai < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'hrdx_pegawai'
  self.primary_key = 'pegawai_id'
end
