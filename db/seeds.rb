# frozen_string_literal: true

require 'faker'

User.create!(
  email: 'admin@justice.gov.uk',
  password: 'change_me',
  admin: true
)

User.create!(
  email: 'user@justice.gov.uk',
  password: 'change_me',
  admin: false
)

10.times do
  User.create!(
    email: "#{Faker::Name.first_name}@justice.gov.uk",
    password: 'change_me',
    admin: false
  )
end

10.times do
  User.create!(
    email: "#{Faker::Name.first_name}@justice.gov.uk",
    password: 'change_me',
    admin: true
  )
end

20.times do
  user = User.offset(rand(User.count)).first
  user.ideas.create!(
    title: Faker::Book.title,
    submission_date: Faker::Time.between(Time.now - 30, Time.now),
    area_of_interest: Idea.area_of_interests.key(rand(Idea.area_of_interests.count)),
    business_area: Idea.business_areas.key(rand(Idea.business_areas.count)),
    it_system: Idea.it_systems.key(rand(Idea.it_systems.count)),
    idea: Faker::Simpsons.quote,
    benefits: Idea.benefits.key(rand(Idea.benefits.count)),
    impact: 'Impact',
    involvement: Idea.involvements.key(rand(Idea.involvements.count))
  )
end

20.times do
  user = User.offset(rand(User.count)).first
  user.ideas.create!(
    title: Faker::Book.title,
    area_of_interest: Idea.area_of_interests.key(rand(Idea.area_of_interests.count)),
    business_area: Idea.business_areas.key(rand(Idea.business_areas.count)),
    it_system: Idea.it_systems.key(rand(Idea.it_systems.count)),
    idea: Faker::Simpsons.quote,
    benefits: Idea.benefits.key(rand(Idea.benefits.count)),
    impact: 'Impact',
    involvement: Idea.involvements.key(rand(Idea.involvements.count))
  )
end

100.times do
  idea = Idea.offset(rand(Idea.count)).first
  user = User.offset(rand(User.count)).first
  idea.comments.create!(
    body: Faker::ChuckNorris.fact,
    user: user
  )
end
