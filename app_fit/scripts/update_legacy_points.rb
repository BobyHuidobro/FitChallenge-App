
# Maratón
ProgressEntry.find_by(user_id: 3, challenge_id: 1, entry_date: Date.today - 6.days)&.update(legacy_points: 12)
ProgressEntry.find_by(user_id: 3, challenge_id: 1, entry_date: Date.today - 4.days)&.update(legacy_points: 18)
ProgressEntry.find_by(user_id: 3, challenge_id: 1, entry_date: Date.today - 1.day)&.update(legacy_points: 20)
ProgressEntry.find_by(user_id: 2, challenge_id: 1, entry_date: Date.today - 5.days)&.update(legacy_points: 10)
ProgressEntry.find_by(user_id: 2, challenge_id: 1, entry_date: Date.today - 3.days)&.update(legacy_points: 15)
ProgressEntry.find_by(user_id: 5, challenge_id: 1, entry_date: Date.today - 7.days)&.update(legacy_points: 25)

# Yoga
ProgressEntry.find_by(user_id: 1, challenge_id: 2, entry_date: Date.today - 10.days)&.update(legacy_points: 50)
ProgressEntry.find_by(user_id: 1, challenge_id: 2, entry_date: Date.today - 9.days)&.update(legacy_points: 50)
ProgressEntry.find_by(user_id: 1, challenge_id: 2, entry_date: Date.today - 8.days)&.update(legacy_points: 50)
ProgressEntry.find_by(user_id: 4, challenge_id: 2, entry_date: Date.today - 8.days)&.update(legacy_points: 50)
ProgressEntry.find_by(user_id: 4, challenge_id: 2, entry_date: Date.today - 6.days)&.update(legacy_points: 50)

# Ciclismo
ProgressEntry.find_by(user_id: 2, challenge_id: 3, entry_date: Date.today - 5.days)&.update(legacy_points: 45)
ProgressEntry.find_by(user_id: 7, challenge_id: 3, entry_date: Date.today - 4.days)&.update(legacy_points: 50)
ProgressEntry.find_by(user_id: 8, challenge_id: 3, entry_date: Date.today - 3.days)&.update(legacy_points: 35)

# Quema Calorías
ProgressEntry.find_by(user_id: 1, challenge_id: 4, entry_date: Date.today - 3.days)&.update(legacy_points: 38)
ProgressEntry.find_by(user_id: 5, challenge_id: 4, entry_date: Date.today - 2.days)&.update(legacy_points: 45)

# Natación
ProgressEntry.find_by(user_id: 2, challenge_id: 6, entry_date: Date.today - 15.days)&.update(legacy_points: 25)
ProgressEntry.find_by(user_id: 3, challenge_id: 6, entry_date: Date.today - 12.days)&.update(legacy_points: 20)

# Caminata
ProgressEntry.find_by(user_id: 4, challenge_id: 7, entry_date: Date.today - 10.days)&.update(legacy_points: 10)
ProgressEntry.find_by(user_id: 4, challenge_id: 7, entry_date: Date.today - 9.days)&.update(legacy_points: 10)
ProgressEntry.find_by(user_id: 8, challenge_id: 7, entry_date: Date.today - 8.days)&.update(legacy_points: 10)

# CrossFit
ProgressEntry.find_by(user_id: 1, challenge_id: 8, entry_date: Date.today - 7.days)&.update(legacy_points: 50)
ProgressEntry.find_by(user_id: 1, challenge_id: 8, entry_date: Date.today - 5.days)&.update(legacy_points: 50)
ProgressEntry.find_by(user_id: 6, challenge_id: 8, entry_date: Date.today - 6.days)&.update(legacy_points: 50)

puts "Legacy points actualizados!"