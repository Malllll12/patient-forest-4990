require 'rails_helper'

RSpec.describe "Movie Show" do
  # Story 2
  # Movie Show
  #
  # As a user,
  # When I visit a movie's show page.
  # I see the movie's title, creation year, and genre,
  # and a list of all its actors from youngest to oldest.
  # And I see the average age of all of the movie's actors
  it 'shows movie info, actors, and actors average age' do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    fox = Studio.create!(name: 'Fox Studios', location: 'Hollywood')

    raiders = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: universal.id)
    temple = Movie.create!(title: 'Temple of Doom', creation_year: 1984, genre: 'Action/Adventure', studio_id: universal.id)
    star = Movie.create!(title: 'Star Wars', creation_year: 1974, genre: 'Sci-fi', studio_id: universal.id)

    karen = Actor.create!(name: "Karen Allen", age: 70)
    harrison = Actor.create!(name: "Harrison Ford", age: 78)
    fisher = Actor.create!(name: "Carrie Fisher", age: 60)

    raiders.actors << harrison
    raiders.actors << karen

    visit "/movies/#{raiders.id}"

    expect(page).to have_content(raiders.title)
    expect(page).to have_content(raiders.creation_year)
    expect(page).to have_content(raiders.genre)
    expect(page).to_not have_content(star.title)

    expect(page).to have_content(harrison.name)
    expect(page).to have_content(karen.name)

    expect(page).to have_content(raiders.average_age)
  end
end
