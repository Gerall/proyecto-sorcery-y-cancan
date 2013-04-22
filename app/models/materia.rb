class Materia < ActiveRecord::Base

  has_many :horarios
  has_many :instructores

  attr_accessible :nombre


  validates :nombre, :presence => true,
  :length => { :maximum =>  20}

  def self.search(search)
  	where('nombre like ?  ', "%#{search}%" )
  end
end
