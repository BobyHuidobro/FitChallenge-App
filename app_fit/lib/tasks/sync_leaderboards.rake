namespace :leaderboards do
    desc "Sincronizar todos los leaderboards con los datos actuales"
    task sync: :environment do
        puts "Sincronizando leaderboards..."
        Challenge.find_each do |challenge|
            Leaderboard.update_for_challenge(challenge)
            puts "✓ Challenge #{challenge.id} - #{challenge.name}"
        end
        puts "Sincronización completada!!"
    end
end
