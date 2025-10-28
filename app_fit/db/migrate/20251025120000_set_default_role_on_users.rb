class SetDefaultRoleOnUsers < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!

  def up
    say_with_time "Backfilling NULL roles to 0 (normal)" do
      # Use a lightweight update to avoid loading models in large tables
      # role is stored as integer (enum: normal=0, admin=1)
      execute "UPDATE users SET role = 0 WHERE role IS NULL"
    end

    say_with_time "Setting default for users.role to 0 (normal)" do
      change_column_default :users, :role, 0
    end
  end

  def down
    say_with_time "Removing default for users.role" do
      change_column_default :users, :role, nil
    end
  end
end
