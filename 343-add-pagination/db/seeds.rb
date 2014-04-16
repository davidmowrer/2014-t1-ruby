(1..100).each do |i|
  user = User.new
  user.email = "user#{i}@example.com"
  user.password = "123"
  user.password_confirmation = "123"
  user.save!
end
