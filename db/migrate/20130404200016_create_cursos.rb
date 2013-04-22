class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :ficha
      t.string :nombre

      t.timestamps
    end
  end
end
