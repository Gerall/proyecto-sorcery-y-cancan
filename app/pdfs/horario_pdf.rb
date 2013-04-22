class HorarioPdf < Prawn::Document

  def initialize(horario, view)
    super()
    @horario = horario
    @view = view
    logo
    deliver_details
    horario_details
  end


  def logo
    logopath =  "#{Rails.root}/app/assets/images/images.jpg"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Horario ", :at => [220, 675], size: 22
  end


  def deliver_details
    move_down 60
    text "Registro:
   #{@horario.id} ", :size => 13
    move_down 20
  end


  def horario_details    
    move_down 60
    id = @horario.id
    dia = @horario.dia
    hora = @horario.hora 
    aula = @horario.aula
    materia = @horario.materia.nombre
    instructor = @horario.instructor.nombres
    curso = @horario.curso.nombre
    table ([["Id",  "#{id} "] ,
    ["Dia", "#{dia} "],
    ["Hora", "#{hora} "],
    ["Aula", "#{aula} "],
    ["Materia", "#{materia} "],
    ["Instructor", "#{instructor}"],
    ["Curso", "#{curso}"],
    
    ]),


    :width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end