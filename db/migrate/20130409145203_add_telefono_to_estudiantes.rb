class AddTelefonoToEstudiantes < ActiveRecord::Migration
  def change
    add_column :estudiantes, :telefono, :string
  end
end
