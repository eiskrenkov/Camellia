Device.destroy_all
Media.destroy_all
Schedule.destroy_all

rand(10..30).times do
  Device.create(
    name: "Device ##{SecureRandom.uuid.split('-').first}", status: DeviceStatus.list.sample, user_id: User.first.id
  )
end

rand(10..30).times do
  Media.create(name: "Media ##{SecureRandom.uuid.split('-').first}")
end

rand(10..30).times do
  Schedule.create(name: "Schedule ##{SecureRandom.uuid.split('-').first}", user_id: User.first.id)
end
