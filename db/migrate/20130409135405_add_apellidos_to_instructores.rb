class AddApellidosToInstructores < ActiveRecord::Migration
  def change
    add_column :instructores, :apellidos, :string
  end
end
