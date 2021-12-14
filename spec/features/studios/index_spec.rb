require 'rails_helper'

RSpec.describe "Studio Index" do
  #  As a user,
  # When I visit the studio index page
  # I see a each studio's name and location
  # And underneath each studio, I see the titles of all of its movies.

  it 'shows studios and their info' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    fox = Studio.create!(name: 'Fox Studios', location: 'Hollywood')

    raiders = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: universal.id)
    temple = Movie.create!(title: 'Temple of Doom', creation_year: 1984, genre: 'Action/Adventure', studio_id: universal.id)
    invisible = Movie.create!(title: 'The invisible Man', creation_year: 2020, genre: 'Horror', studio_id: universal.id)

    visit "/studios"

      expect(page).to have_content(universal.name)
      expect(page).to have_content(universal.location)

      expect(page).to have_content(raiders.title)
      expect(page).to have_content(temple.title)
      expect(page).to have_content(invisible.title)
  end
end
