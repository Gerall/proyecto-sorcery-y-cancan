class AddMateriaIdToInstructores < ActiveRecord::Migration
  def change
    add_column :instructores, :materia_id, :integer
  end
end
