require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe 'methods' do
    it '.average_age' do
      universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

      raiders = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: universal.id)
      temple = Movie.create!(title: 'Temple of Doom', creation_year: 1984, genre: 'Action/Adventure', studio_id: universal.id)

      karen = Actor.create!(name: "Karen Allen", age: 70)
      harrison = Actor.create!(name: "Harrison Ford", age: 78)

      raiders.actors << harrison
      raiders.actors << karen

      expect(raiders.average_age).to eq(74)
    end

    xit ".age_after_beauty" do
      universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

      raiders = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: universal.id)
      temple = Movie.create!(title: 'Temple of Doom', creation_year: 1984, genre: 'Action/Adventure', studio_id: universal.id)

      harrison = Actor.create!(name: "Harrison Ford", age: 78)
      karen = Actor.create!(name: "Karen Allen", age: 70)

      raiders.actors << harrison
      raiders.actors << karen

      expect(karen.name).to appear_before(harrison.name)
    end
  end
end
