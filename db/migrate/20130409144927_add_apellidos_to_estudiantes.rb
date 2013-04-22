class AddApellidosToEstudiantes < ActiveRecord::Migration
  def change
    add_column :estudiantes, :apellidos, :string
  end
end
