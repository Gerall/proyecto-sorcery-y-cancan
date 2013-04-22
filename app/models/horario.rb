class Horario < ActiveRecord::Base
  belongs_to :materia
  belongs_to :instructor
  belongs_to :curso
  attr_accessible :aula, :dia, :hora, :materia_id, :instructor_id, :curso_id, :materia_nombre, :instructor_nombres, :curso_nombre

  validates :aula, :presence => true,
  :length => { :maximum => 50 }

  

  validates_presence_of :hora 

  def self.search(search)
  	where('aula like ?  ', "%#{search}%" )
  end
end
