class Clause < ApplicationRecord
  def self.parse_data clause_data
    clause_data.each do |clause|
      Clause.create(reference_id: clause[:id], text: clause[:text])
    end
  end
end
