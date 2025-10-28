class SetDefaultRoleOnUsers < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!

  def up
    say_with_time "Backfilling NULL roles to 'user'" do
      # Use a lightweight update to avoid loading models in large tables
      execute "UPDATE users SET role = 'user' WHERE role IS NULL"
    end

    say_with_time "Setting default for users.role to 'user'" do
      change_column_default :users, :role, 'user'
    end
  end

  def down
    say_with_time "Removing default for users.role" do
      change_column_default :users, :role, nil
    end
  end
end
