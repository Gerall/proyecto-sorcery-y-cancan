class InstructorPdf < Prawn::Document

  def initialize(instructor, view)
    super()
    @instructor = instructor
    @view = view
    logo
    deliver_details
    instructor_details
  end


  def logo
    logopath =  "#{Rails.root}/app/assets/images/images.jpg"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Instructor ", :at => [220, 675], size: 22
  end


  def deliver_details
    move_down 60
    text "Instructor Id:
   #{@instructor.id} ", :size => 13
    move_down 20
    text "Nombre:
   #{@instructor.nombres} ", :size => 13
  end


  def instructor_details    
    move_down 60
    id = @instructor.id
    nombres = @instructor.nombres
    apellidos = @instructor.apellidos
    cedula = @instructor.cedula
    email = @instructor.email
    direccion = @instructor.direccion
    telefono = @instructor.telefono
    fch_ncto = @instructor.fch_nacimiento
    materia = @instructor.materia.nombre

    table ([["Id",  "#{id} "] ,
    ["Nombres", "#{nombres} "],
    ["Apellidos", "#{apellidos} "],
    ["Cedula", "#{cedula} "],
    ["Email", "#{email} "],
    ["Direccion", "#{direccion}"],
    ["Telefono", "#{telefono}"],
    ["Fch_ncto", "#{fch_ncto}"],
    ["Materia", "#{materia}"],
    
    ]),


    :width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end