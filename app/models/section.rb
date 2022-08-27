class Section < ApplicationRecord
  def self.parse_data section_data
    relevant_clauses = Clause.where(id: section_data.first[:clauses_ids])
    Section.create(clause_ids: section_data.first[:clauses_ids], content: relevant_clauses.map { |clause| clause.text}.join(";"), reference_id: section_data.first[:id])
  end
end
