namespace :orion do
  task :init_dreams => :environment do
    50.times do |i|
      dream = Dream.create(name: "Dream_#{i}", date: Date.today)
      sequence = Sequence.create(name: "Sequence_#{i}", description: "Description_#{j}", dream: dream)
      3.times do |j|
        Character.create(first_name: "Character_#{j}", last_name: "Do", sequence: sequence)
        Place.create(name: "Place_#{j}", sequence: sequence)
      end
    end
  end
end