require 'rails_helper'

RSpec.describe Section, type: :model do
  context 'parse data' do
    before do
      Clause.parse_data([
        { "id": 1, "text": "The quick brown fox" },
        { "id": 2, "text": "jumps over the lazy dog" },
        { "id": 3, "text": "And dies" },
        { "id": 4, "text": "The white horse is white" }
        ]
      )
    end
    it 'should create a correct section' do
      expect do
        Section.parse_data([
            { "id": 1, "clauses_ids": [1, 2] }
          ]
        )
      end.to change{Section.count}.by(1)
      expect(Section.last.content).to eq("The quick brown fox;jumps over the lazy dog")
    end
  end
end