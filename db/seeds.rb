Device.destroy_all
Media.destroy_all
Schedule.destroy_all

rand(10..30).times do
  Device.create(name: SecureRandom.uuid.split('-').first, status: DeviceStatus.list.sample)
end

rand(10..30).times do
  Media.create(name: SecureRandom.uuid.split('-').first)
end

rand(10..30).times do
  Schedule.create(name: SecureRandom.uuid.split('-').first, user_id: User.last.id)
end
