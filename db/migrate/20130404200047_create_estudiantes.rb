class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :nombres
      t.string :cedula
      t.string :email
      t.string :direccion
      t.date :fch_ncto
      t.references :curso

      t.timestamps
    end
    add_index :estudiantes, :curso_id
  end
end
