class Instructor < ActiveRecord::Base

  has_many :horarios
  belongs_to :materia 

  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :nombres, :telefono, :apellidos, :materia_id, :materia_nombre, :imagen

  validates :nombres, :presence => true,
  :length => { :maximum => 80 }
  
  validates :email, :presence => true,
  :uniqueness => true,
  :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :cedula, :presence => true,
  :length => { :minimum => 6, :maximum => 15 },
  :numericality => true
  
  validates :apellidos, :presence => true,
  :length => { :maximum => 30 }
  
  validates :telefono, :presence => true,
  :length => { :minimum => 7, :maximum => 15 },
  :numericality => true
  
  validates_presence_of :direccion

  validates_presence_of :fch_nacimiento

  

  def self.search(search)
  	where('nombres like ? or email like ? or cedula like ? or direccion like ? or telefono like ? or apellidos like ?', "%#{search}%", "%#{search}%" , "%#{search}%" , "%#{search}%" , "%#{search}%" , "%#{search}%" )
  end
  
  has_attached_file :imagen, :styles => { :small => "150x150>", :lsmall => "30x30>" }


  validates_attachment_presence :imagen
  validates_attachment_size :imagen, :less_than => 5.megabytes
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png']
end
 