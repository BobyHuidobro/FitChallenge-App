class AddRoleTmpToUsers < ActiveRecord::Migration[7.0]
  disable_ddl_transaction! # opcional para grandes tablas (usar con cuidado)

  def up
    # 1) agregar columna temporal con default = 0 (user)
    add_column :users, :role_tmp, :integer, default: 0, null: false

    # 2) backfill values desde role (string) -> role_tmp (integer)
    say_with_time "Backfilling users.role_tmp from users.role" do
      mapping = { 'user' => 0, 'admin' => 1 } # ajusta si tenías otros roles (ej. moderator)
      User.reset_column_information
      User.find_each do |u|
        value = mapping[u.role.to_s.downcase] || 0
        u.update_column(:role_tmp, value)
      end
    end

    # 3) eliminar la columna antigua (string)
    remove_column :users, :role

    # 4) renombrar role_tmp a role
    rename_column :users, :role_tmp, :role

    # 5) (opcional) agregar índice si lo deseas
    add_index :users, :role
  end

  def down
    # reversión: agrega la columna string de vuelta (sin datos precisos)
    add_column :users, :role, :string

    # intentar mapear de vuelta a strings
    mapping_back = { 0 => 'user', 1 => 'admin' }
    User.reset_column_information
    User.find_each do |u|
      u.update_column(:role, mapping_back[u.role] || 'user')
    end

    remove_index :users, :role if index_exists?(:users, :role)
    remove_column :users, :role
    rename_column :users, :role_tmp, :role if column_exists?(:users, :role_tmp)
  end
end