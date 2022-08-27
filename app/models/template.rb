class Template < ApplicationRecord
  has_many :documents
  def transform_content
    result = content

    content.scan(/\[(.*?)\]/).each do |t|
      placeholder = t.first.split("-")
      if (placeholder[0] == "CLAUSE")
        clause = Clause.where(reference_id: placeholder[1])
        result.gsub!("[#{t.first}]", clause.first.text) if clause.present?
      elsif (placeholder[0] == "SECTION")
        section = Section.where(reference_id: placeholder[1])
        result.gsub!("[#{t.first}]", section.first.content) if section.present?
      end
    end
    result
  end
end
