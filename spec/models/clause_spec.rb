require 'rails_helper'

RSpec.describe Clause, type: :model do
  context 'parse data' do
    it 'should create 4 new clauses' do
      expect do
        Clause.parse_data([
          { "id": 1, "text": "The quick brown fox" },
          { "id": 2, "text": "jumps over the lazy dog" },
          { "id": 3, "text": "And dies" },
          { "id": 4, "text": "The white horse is white" }
          ]
        )
      end.to change{Clause.count}.by(4)
    end
  end
end