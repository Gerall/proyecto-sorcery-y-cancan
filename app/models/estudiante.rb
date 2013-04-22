class Estudiante < ActiveRecord::Base
  
  belongs_to :curso

  attr_accessible :cedula, :direccion, :email, :fch_ncto, :nombres, :telefono, :apellidos, :curso_id, :curso_nombre, :imagen
  
  
  validates :nombres, :presence => true,
  :length => { :maximum => 80 }
  
  validates :email, :presence => true,
  :uniqueness => true,
  :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :cedula, :presence => true,
  :length => { :minimum => 6, :maximum => 15 },
  :numericality => true

  validates :telefono, :presence => true,
  :length => { :minimum => 7, :maximum => 15 },
  :numericality => true

  validates_presence_of :direccion 

  validates_presence_of :fch_ncto

  validates :apellidos, :presence => true,
  :length => { :maximum => 30 }

  def self.search(search)
  	where('nombres like ? or cedula like ?  or direccion like ? or email like ? or apellidos like ? or telefono like ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
  end  

  has_attached_file :imagen, :styles => { :small => "150x150>", :lsmall => "30x30>" }


  validates_attachment_presence :imagen
  validates_attachment_size :imagen, :less_than => 5.megabytes
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png']

end
 