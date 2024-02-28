# frozen_string_literal: true
class OldDatabaseBase < ActiveRecord::Base
  self.abstract_class = true
  connects_to database: {writing: :old_database, reading: :old_database}
end
