require 'faker'

User.destroy_all
Team.destroy_all
Membership.destroy_all
List.destroy_all
Event.destroy_all
Objective.destroy_all
Enrollment.destroy_all
Submission.destroy_all

50.times do
  User.create(username: Faker::Internet.user_name, password: "password", email: Faker::Internet.email)
end

all_users = User.all

10.times do
  t = Team.create(name: Faker::Team.name, mascot: Faker::Avatar.image, leader: all_users.sample)
  Membership.create(team_id: t.id, user_id: t.leader_id)
end

all_teams = Team.all

User.all.each do |user|
  Membership.create(team_id: all_teams.sample.id, user_id: user.id)
end

5.times do
  List.create(title: Faker::App.name)
end

all_lists = List.all
type = ["daily", "rally"]

20.times do
  Event.create(name: Faker::Commerce.department, event_type: type.sample, list_id: all_lists.sample.id, event_start: Date.today-rand(5), event_end: Date.today+rand(2))
end

all_lists.each do |list|
  10.times do
    Objective.create(clue: Faker::Hacker.say_something_smart, list_id: list.id)
  end
end

all_events = Event.all

all_events.each do |event|
  i = 0
  while i < 4
    join = Enrollment.new(team_id: all_teams.sample.id, event_id: event.id)
    unless event.teams.include?(Team.find(join.team_id))
      join.save
      i += 1
    end
  end
end

enrollments = Enrollment.all

50.times do
  Submission.create(objective_id: rand(1..10), enrollment_id: enrollments.sample, image: Faker::Company.logo)
end


