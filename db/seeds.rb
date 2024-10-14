# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  nickname: "test1",
  email: "test1@test.com",
  password: "111111",
  password_confirmation: "111111"
)
10.times do |i|
  start_start_at = Date.new(2024, 10, 20)
  start_end_at = Date.new(2024, 10, 31)
  end_start_at = Date.new(2024, 11, 10)
  end_end_at = Date.new(2024, 11, 20)
  Event.create!(
    owner_id: 1,
    name: "event#{i + 1}",
    place: "event_place#{i + 1}",
    start_at: Random.rand(start_start_at..start_end_at),
    end_at: Random.rand(end_start_at..end_end_at),
    content: "content of event#{i + 1}"
  )
end