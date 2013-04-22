class Curso < ActiveRecord::Base

  has_many :estudiantes

  attr_accessible :ficha, :nombre

  validates :nombre, :presence => true,
  :length => { :maximum =>  80}
  
   validates :ficha, :presence => true,
  :length => { :maximum =>  10},
  :length => { :minimum => 6, :maximum => 10 },
  :numericality => true
  
  def self.search(search)
  	where('nombre like ? or ficha like ? ', "%#{search}%" , "%#{search}%" )
  end
end
