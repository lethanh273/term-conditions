require 'rails_helper'

RSpec.describe Document, type: :model do
  context 'parse data' do
    before do
      Clause.parse_data([
        { "id": 1, "text": "The quick brown fox" },
        { "id": 2, "text": "jumps over the lazy dog" },
        { "id": 3, "text": "And dies" },
        { "id": 4, "text": "The white horse is white" }
        ]
      )
      Section.parse_data([
        { "id": 1, "clauses_ids": [1, 2] }
      ]
      )
    end
    it 'should create a correct body' do

      template_content = "A T&C Document
      This document is made of plaintext.
      Is made of [CLAUSE-3].
      Is made of [CLAUSE-4].
      Is made of [SECTION-1].
      Your legals."

      template = create(:template, content: template_content)

      create(:document, template: template)

      expected_body = "A T&C Document
      This document is made of plaintext.
      Is made of And dies.
      Is made of The white horse is white.
      Is made of The quick brown fox;jumps over the lazy dog.
      Your legals."

      expect(Document.last.body).to eq(expected_body)
    end
  end
end