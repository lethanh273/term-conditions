class Document < ApplicationRecord
  belongs_to :template

  after_create :create_body
  def create_body
    p template.content
    self.body = template.transform_content
    self.save
  end
end
