# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "🧹 Limpiando base de datos..."
# Limpiar en orden correcto debido a las dependencias
UserBadge.destroy_all
Leaderboard.destroy_all
ProgressEntry.destroy_all
Participation.destroy_all
Notification.destroy_all
Challenge.destroy_all
ScoringRule.destroy_all
Badge.destroy_all
User.destroy_all

puts "👥 Creando usuarios..."
# Usuarios
users = [
  User.create!(
    email: 'admin@fitchallenge.com',
    password: 'password123',
    username: 'admin_master',
    role: 'admin'
  ),
  User.create!(
    email: 'juan.perez@gmail.com',
    password: 'password123',
    username: 'juanperez',
    role: 'user'
  ),
  User.create!(
    email: 'maria.gonzalez@gmail.com',
    password: 'password123',
    username: 'mariagonzalez',
    role: 'user'
  ),
  User.create!(
    email: 'carlos.rodriguez@gmail.com',
    password: 'password123',
    username: 'carlosrod',
    role: 'user'
  ),
  User.create!(
    email: 'ana.martinez@gmail.com',
    password: 'password123',
    username: 'anamartinez',
    role: 'user'
  ),
  User.create!(
    email: 'pedro.sanchez@gmail.com',
    password: 'password123',
    username: 'pedrosanchez',
    role: 'user'
  ),
  User.create!(
    email: 'laura.lopez@gmail.com',
    password: 'password123',
    username: 'lauralopez',
    role: 'user'
  ),
  User.create!(
    email: 'diego.fernandez@gmail.com',
    password: 'password123',
    username: 'diegofer',
    role: 'user'
  ),
  User.create!(
    email: 'sofia.ramirez@gmail.com',
    password: 'password123',
    username: 'sofiaramirez',
    role: 'user'
  )
]

puts "🏅 Creando insignias..."
# Badges
badges = [
  Badge.create!(
    name: 'Primera Victoria',
    description: 'Ganaste tu primer desafío',
    icon_url: 'https://img.icons8.com/color/96/trophy.png'
  ),
  Badge.create!(
    name: 'Corredor Principiante',
    description: 'Corriste tu primera milla',
    icon_url: 'https://img.icons8.com/color/96/running.png'
  ),
  Badge.create!(
    name: 'Maratonista',
    description: 'Completaste 100 millas corriendo',
    icon_url: 'https://img.icons8.com/color/96/marathon.png'
  ),
  Badge.create!(
    name: 'Constancia',
    description: 'Registraste progreso durante 30 días consecutivos',
    icon_url: 'https://img.icons8.com/color/96/calendar.png'
  ),
  Badge.create!(
    name: 'Guerrero del Gimnasio',
    description: 'Completaste 50 entrenamientos',
    icon_url: 'https://img.icons8.com/color/96/weightlifting.png'
  ),
  Badge.create!(
    name: 'Yoga Master',
    description: 'Practicaste yoga 30 veces',
    icon_url: 'https://img.icons8.com/color/96/yoga.png'
  ),
  Badge.create!(
    name: 'Ciclista Urbano',
    description: 'Pedaleaste 500 kilómetros',
    icon_url: 'https://img.icons8.com/color/96/cycling.png'
  ),
  Badge.create!(
    name: 'Nadador Olímpico',
    description: 'Nadaste 100 kilómetros',
    icon_url: 'https://img.icons8.com/color/96/swimming.png'
  ),
  Badge.create!(
    name: 'Mentor',
    description: 'Creaste 10 desafíos públicos',
    icon_url: 'https://img.icons8.com/color/96/teacher.png'
  ),
  Badge.create!(
    name: 'Socialite Fitness',
    description: 'Participaste en 20 desafíos',
    icon_url: 'https://img.icons8.com/color/96/people.png'
  )
]

puts "📊 Creando reglas de puntuación..."
# Scoring Rules
scoring_rules = [
  ScoringRule.create!(
    rule_type: 'Distancia',
    description: '1 punto por cada kilómetro recorrido',
    user: users[0],
    public: true
  ),
  ScoringRule.create!(
    rule_type: 'Tiempo',
    description: '10 puntos por cada hora de ejercicio',
    user: users[0],
    public: true
  ),
  ScoringRule.create!(
    rule_type: 'Repeticiones',
    description: '1 punto por cada 10 repeticiones',
    user: users[1],
    public: true
  ),
  ScoringRule.create!(
    rule_type: 'Calorías',
    description: '1 punto por cada 100 calorías quemadas',
    user: users[2],
    public: true
  ),
  ScoringRule.create!(
    rule_type: 'Sesiones',
    description: '50 puntos por cada sesión completada',
    user: users[0],
    public: true
  ),
  ScoringRule.create!(
    rule_type: 'Pasos',
    description: '1 punto por cada 1000 pasos',
    user: users[3],
    public: true
  ),
  ScoringRule.create!(
    rule_type: 'Personalizada',
    description: 'Sistema de puntos personalizado del usuario',
    user: users[4],
    public: false
  )
]

puts "🏆 Creando desafíos..."
# Challenges
challenges = [
  Challenge.create!(
    user: users[1],
    name: 'Desafío Maratón de Octubre',
    description: 'Corre 100 kilómetros durante el mes de octubre',
    start_date: Date.new(2025, 10, 1),
    end_date: Date.new(2025, 10, 31),
    visibility: 'public',
    category: 'Carrera',
    scoring_rule: scoring_rules[0]
  ),
  Challenge.create!(
    user: users[2],
    name: 'Yoga 30 días',
    description: 'Practica yoga todos los días durante 30 días',
    start_date: Date.new(2025, 10, 1),
    end_date: Date.new(2025, 10, 30),
    visibility: 'public',
    category: 'Yoga',
    scoring_rule: scoring_rules[4]
  ),
  Challenge.create!(
    user: users[1],
    name: 'Ciclismo de Montaña',
    description: 'Pedalea 200 km en rutas de montaña',
    start_date: Date.new(2025, 10, 5),
    end_date: Date.new(2025, 11, 5),
    visibility: 'public',
    category: 'Ciclismo',
    scoring_rule: scoring_rules[0]
  ),
  Challenge.create!(
    user: users[3],
    name: 'Quema 10,000 Calorías',
    description: 'Quema 10,000 calorías en ejercicios cardiovasculares',
    start_date: Date.new(2025, 10, 10),
    end_date: Date.new(2025, 11, 10),
    visibility: 'public',
    category: 'Cardio',
    scoring_rule: scoring_rules[3]
  ),
  Challenge.create!(
    user: users[4],
    name: 'Entrenamiento de Fuerza',
    description: 'Completa 20 sesiones de entrenamiento con pesas',
    start_date: Date.new(2025, 10, 1),
    end_date: Date.new(2025, 10, 31),
    visibility: 'private',
    category: 'Fuerza',
    scoring_rule: scoring_rules[4]
  ),
  Challenge.create!(
    user: users[5],
    name: 'Natación Olímpica',
    description: 'Nada 50 kilómetros en piscina olímpica',
    start_date: Date.new(2025, 9, 1),
    end_date: Date.new(2025, 10, 31),
    visibility: 'public',
    category: 'Natación',
    scoring_rule: scoring_rules[0]
  ),
  Challenge.create!(
    user: users[6],
    name: 'Caminata de 10,000 Pasos',
    description: 'Camina 10,000 pasos diarios durante 21 días',
    start_date: Date.new(2025, 10, 1),
    end_date: Date.new(2025, 10, 21),
    visibility: 'public',
    category: 'Caminata',
    scoring_rule: scoring_rules[5]
  ),
  Challenge.create!(
    user: users[7],
    name: 'CrossFit Intensivo',
    description: 'Completa 15 WODs (Workout of the Day)',
    start_date: Date.new(2025, 10, 1),
    end_date: Date.new(2025, 10, 15),
    visibility: 'public',
    category: 'CrossFit',
    scoring_rule: scoring_rules[4]
  )
]

puts "🤝 Creando participaciones..."
# Participations
participations = [
  # Desafío 1 - Maratón de Octubre
  Participation.create!(user: users[2], challenge: challenges[0], joined_at: DateTime.now - 14.days, status: 'active', total_points: 65),
  Participation.create!(user: users[3], challenge: challenges[0], joined_at: DateTime.now - 13.days, status: 'active', total_points: 82),
  Participation.create!(user: users[4], challenge: challenges[0], joined_at: DateTime.now - 12.days, status: 'active', total_points: 45),
  Participation.create!(user: users[5], challenge: challenges[0], joined_at: DateTime.now - 10.days, status: 'active', total_points: 91),
  
  # Desafío 2 - Yoga 30 días
  Participation.create!(user: users[1], challenge: challenges[1], joined_at: DateTime.now - 14.days, status: 'active', total_points: 700),
  Participation.create!(user: users[4], challenge: challenges[1], joined_at: DateTime.now - 12.days, status: 'active', total_points: 600),
  Participation.create!(user: users[6], challenge: challenges[1], joined_at: DateTime.now - 11.days, status: 'active', total_points: 650),
  
  # Desafío 3 - Ciclismo de Montaña
  Participation.create!(user: users[2], challenge: challenges[2], joined_at: DateTime.now - 9.days, status: 'active', total_points: 125),
  Participation.create!(user: users[7], challenge: challenges[2], joined_at: DateTime.now - 8.days, status: 'active', total_points: 140),
  Participation.create!(user: users[8], challenge: challenges[2], joined_at: DateTime.now - 7.days, status: 'active', total_points: 95),
  
  # Desafío 4 - Quema Calorías
  Participation.create!(user: users[1], challenge: challenges[3], joined_at: DateTime.now - 5.days, status: 'active', total_points: 78),
  Participation.create!(user: users[5], challenge: challenges[3], joined_at: DateTime.now - 4.days, status: 'active', total_points: 92),
  
  # Desafío 6 - Natación
  Participation.create!(user: users[2], challenge: challenges[5], joined_at: DateTime.now - 30.days, status: 'completed', total_points: 50),
  Participation.create!(user: users[3], challenge: challenges[5], joined_at: DateTime.now - 28.days, status: 'active', total_points: 45),
  
  # Desafío 7 - Caminata
  Participation.create!(user: users[4], challenge: challenges[6], joined_at: DateTime.now - 14.days, status: 'active', total_points: 140),
  Participation.create!(user: users[8], challenge: challenges[6], joined_at: DateTime.now - 12.days, status: 'active', total_points: 120),
  
  # Desafío 8 - CrossFit
  Participation.create!(user: users[1], challenge: challenges[7], joined_at: DateTime.now - 10.days, status: 'active', total_points: 500),
  Participation.create!(user: users[6], challenge: challenges[7], joined_at: DateTime.now - 9.days, status: 'active', total_points: 450)
]

puts "📝 Creando entradas de progreso..."
# Progress Entries
progress_entries = [
  # Entradas para el desafío de Maratón
  ProgressEntry.create!(user: users[2], challenge: challenges[0], entry_date: Date.today - 5.days, points_awarded: 10, quantity: 10, approved: true),
  ProgressEntry.create!(user: users[2], challenge: challenges[0], entry_date: Date.today - 3.days, points_awarded: 15, quantity: 15, approved: true),
  ProgressEntry.create!(user: users[3], challenge: challenges[0], entry_date: Date.today - 6.days, points_awarded: 12, quantity: 12, approved: true),
  ProgressEntry.create!(user: users[3], challenge: challenges[0], entry_date: Date.today - 4.days, points_awarded: 18, quantity: 18, approved: true),
  ProgressEntry.create!(user: users[3], challenge: challenges[0], entry_date: Date.today - 1.day, points_awarded: 20, quantity: 20, approved: true),
  ProgressEntry.create!(user: users[5], challenge: challenges[0], entry_date: Date.today - 7.days, points_awarded: 25, quantity: 25, approved: true),
  
  # Entradas para Yoga
  ProgressEntry.create!(user: users[1], challenge: challenges[1], entry_date: Date.today - 10.days, points_awarded: 50, quantity: 1, approved: true),
  ProgressEntry.create!(user: users[1], challenge: challenges[1], entry_date: Date.today - 9.days, points_awarded: 50, quantity: 1, approved: true),
  ProgressEntry.create!(user: users[1], challenge: challenges[1], entry_date: Date.today - 8.days, points_awarded: 50, quantity: 1, approved: true),
  ProgressEntry.create!(user: users[4], challenge: challenges[1], entry_date: Date.today - 8.days, points_awarded: 50, quantity: 1, approved: true),
  ProgressEntry.create!(user: users[4], challenge: challenges[1], entry_date: Date.today - 6.days, points_awarded: 50, quantity: 1, approved: true),
  
  # Entradas para Ciclismo
  ProgressEntry.create!(user: users[2], challenge: challenges[2], entry_date: Date.today - 5.days, points_awarded: 45, quantity: 45, approved: true),
  ProgressEntry.create!(user: users[7], challenge: challenges[2], entry_date: Date.today - 4.days, points_awarded: 50, quantity: 50, approved: true),
  ProgressEntry.create!(user: users[8], challenge: challenges[2], entry_date: Date.today - 3.days, points_awarded: 35, quantity: 35, approved: true),
  
  # Entradas para Quema Calorías
  ProgressEntry.create!(user: users[1], challenge: challenges[3], entry_date: Date.today - 3.days, points_awarded: 38, quantity: 3800, approved: true),
  ProgressEntry.create!(user: users[5], challenge: challenges[3], entry_date: Date.today - 2.days, points_awarded: 45, quantity: 4500, approved: true),
  
  # Entradas para Natación
  ProgressEntry.create!(user: users[2], challenge: challenges[5], entry_date: Date.today - 15.days, points_awarded: 25, quantity: 25, approved: true),
  ProgressEntry.create!(user: users[3], challenge: challenges[5], entry_date: Date.today - 12.days, points_awarded: 20, quantity: 20, approved: true),
  
  # Entradas para Caminata
  ProgressEntry.create!(user: users[4], challenge: challenges[6], entry_date: Date.today - 10.days, points_awarded: 10, quantity: 10000, approved: true),
  ProgressEntry.create!(user: users[4], challenge: challenges[6], entry_date: Date.today - 9.days, points_awarded: 10, quantity: 10000, approved: true),
  ProgressEntry.create!(user: users[8], challenge: challenges[6], entry_date: Date.today - 8.days, points_awarded: 10, quantity: 10000, approved: true),
  
  # Entradas para CrossFit
  ProgressEntry.create!(user: users[1], challenge: challenges[7], entry_date: Date.today - 7.days, points_awarded: 50, quantity: 1, approved: true),
  ProgressEntry.create!(user: users[1], challenge: challenges[7], entry_date: Date.today - 5.days, points_awarded: 50, quantity: 1, approved: true),
  ProgressEntry.create!(user: users[6], challenge: challenges[7], entry_date: Date.today - 6.days, points_awarded: 50, quantity: 1, approved: true),
  
  # Algunas entradas pendientes de aprobación
  ProgressEntry.create!(user: users[2], challenge: challenges[0], entry_date: Date.today, points_awarded: 0, quantity: 8, approved: false),
  ProgressEntry.create!(user: users[4], challenge: challenges[1], entry_date: Date.today, points_awarded: 0, quantity: 1, approved: false)
]

puts "🥇 Creando tablas de clasificación..."
# Leaderboards
leaderboards = [
  # Leaderboard Desafío 1 - Maratón
  Leaderboard.create!(challenge: challenges[0], user: users[5], total_points: 91, rank: 1),
  Leaderboard.create!(challenge: challenges[0], user: users[3], total_points: 82, rank: 2),
  Leaderboard.create!(challenge: challenges[0], user: users[2], total_points: 65, rank: 3),
  Leaderboard.create!(challenge: challenges[0], user: users[4], total_points: 45, rank: 4),
  
  # Leaderboard Desafío 2 - Yoga
  Leaderboard.create!(challenge: challenges[1], user: users[1], total_points: 700, rank: 1),
  Leaderboard.create!(challenge: challenges[1], user: users[6], total_points: 650, rank: 2),
  Leaderboard.create!(challenge: challenges[1], user: users[4], total_points: 600, rank: 3),
  
  # Leaderboard Desafío 3 - Ciclismo
  Leaderboard.create!(challenge: challenges[2], user: users[7], total_points: 140, rank: 1),
  Leaderboard.create!(challenge: challenges[2], user: users[2], total_points: 125, rank: 2),
  Leaderboard.create!(challenge: challenges[2], user: users[8], total_points: 95, rank: 3),
  
  # Leaderboard Desafío 4 - Calorías
  Leaderboard.create!(challenge: challenges[3], user: users[5], total_points: 92, rank: 1),
  Leaderboard.create!(challenge: challenges[3], user: users[1], total_points: 78, rank: 2),
  
  # Leaderboard Desafío 6 - Natación
  Leaderboard.create!(challenge: challenges[5], user: users[2], total_points: 50, rank: 1),
  Leaderboard.create!(challenge: challenges[5], user: users[3], total_points: 45, rank: 2),
  
  # Leaderboard Desafío 7 - Caminata
  Leaderboard.create!(challenge: challenges[6], user: users[4], total_points: 140, rank: 1),
  Leaderboard.create!(challenge: challenges[6], user: users[8], total_points: 120, rank: 2),
  
  # Leaderboard Desafío 8 - CrossFit
  Leaderboard.create!(challenge: challenges[7], user: users[1], total_points: 500, rank: 1),
  Leaderboard.create!(challenge: challenges[7], user: users[6], total_points: 450, rank: 2)
]

puts "🔔 Creando notificaciones..."
# Notifications
notifications = [
  Notification.create!(user: users[1], kind: 'challenge_joined', read: false),
  Notification.create!(user: users[1], kind: 'progress_approved', read: true),
  Notification.create!(user: users[2], kind: 'badge_earned', read: false),
  Notification.create!(user: users[2], kind: 'challenge_completed', read: true),
  Notification.create!(user: users[3], kind: 'leaderboard_update', read: false),
  Notification.create!(user: users[3], kind: 'new_challenge', read: false),
  Notification.create!(user: users[4], kind: 'challenge_reminder', read: true),
  Notification.create!(user: users[5], kind: 'achievement_unlocked', read: false),
  Notification.create!(user: users[6], kind: 'weekly_summary', read: true),
  Notification.create!(user: users[7], kind: 'friend_joined', read: false),
  Notification.create!(user: users[8], kind: 'challenge_ending_soon', read: false),
  Notification.create!(user: users[1], kind: 'top_3_ranking', read: false),
  Notification.create!(user: users[2], kind: 'milestone_reached', read: true),
  Notification.create!(user: users[4], kind: 'progress_approved', read: false)
]

puts "🎖️ Asignando insignias a usuarios..."
# User Badges
user_badges = [
  UserBadge.create!(user: users[1], badge: badges[0], awarded_at: DateTime.now - 20.days),
  UserBadge.create!(user: users[1], badge: badges[4], awarded_at: DateTime.now - 15.days),
  UserBadge.create!(user: users[2], badge: badges[1], awarded_at: DateTime.now - 25.days),
  UserBadge.create!(user: users[2], badge: badges[0], awarded_at: DateTime.now - 18.days),
  UserBadge.create!(user: users[2], badge: badges[6], awarded_at: DateTime.now - 10.days),
  UserBadge.create!(user: users[3], badge: badges[2], awarded_at: DateTime.now - 30.days),
  UserBadge.create!(user: users[3], badge: badges[3], awarded_at: DateTime.now - 12.days),
  UserBadge.create!(user: users[4], badge: badges[5], awarded_at: DateTime.now - 8.days),
  UserBadge.create!(user: users[5], badge: badges[7], awarded_at: DateTime.now - 22.days),
  UserBadge.create!(user: users[5], badge: badges[0], awarded_at: DateTime.now - 16.days),
  UserBadge.create!(user: users[6], badge: badges[3], awarded_at: DateTime.now - 14.days),
  UserBadge.create!(user: users[7], badge: badges[8], awarded_at: DateTime.now - 28.days),
  UserBadge.create!(user: users[8], badge: badges[9], awarded_at: DateTime.now - 5.days),
  UserBadge.create!(user: users[1], badge: badges[9], awarded_at: DateTime.now - 3.days)
]

puts "✅ ¡Seed completado exitosamente!"
puts "📊 Resumen de datos creados:"
puts "   - Usuarios: #{User.count}"
puts "   - Insignias: #{Badge.count}"
puts "   - Reglas de Puntuación: #{ScoringRule.count}"
puts "   - Desafíos: #{Challenge.count}"
puts "   - Participaciones: #{Participation.count}"
puts "   - Entradas de Progreso: #{ProgressEntry.count}"
puts "   - Tablas de Clasificación: #{Leaderboard.count}"
puts "   - Notificaciones: #{Notification.count}"
puts "   - Insignias de Usuario: #{UserBadge.count}"
puts "🎉 Base de datos lista para usar!"
