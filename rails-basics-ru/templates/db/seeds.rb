require 'faker'

100.times do |_index|
  Task.create(
    name: Faker::Lorem.sentence,
    status: 'new_task',
    description: Faker::Lorem.paragraph,
    creator: Faker::Name.name,
    completed: [true, false].sample
  )
end
