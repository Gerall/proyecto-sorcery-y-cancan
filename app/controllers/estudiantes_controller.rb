class EstudiantesController < ApplicationController
  
  before_filter :require_login

  load_and_authorize_resource :only => [:new, :edit, :destroy] 
  
  helper_method :sort_column, :sort_direction

  before_filter :find_curso_estudiantes

  def index
    #@estudiantes = @curso.estudiantes.search(params[:search]).page(params[:page]).per_page(2)
    @rxp = (params[:registro])? params[:registro].to_i : 3
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    #@estudiantes = Estudiante.search(params[:search]).page(params[:page]).per_page(@rxp)
    @estudiantes = Estudiante.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    respond_to do|format|
      format.html # index.html.erb
      format.json { render :json => @estudiantes }
    end
  end

  
  def show
    @estudiante = Estudiante.find(params[:id])
  end

  
  def new
    @estudiante = Estudiante.new
  end

  
  def edit
    @estudiante = Estudiante.find(params[:id])
  end

  
  def create
    @estudiante = @curso.estudiantes.build(params[:estudiante])
    render :action => :new unless @estudiante.save
    @estudiantes = Estudiante.all
  end


  def update
     @estudiante = Estudiante.find(params[:id])
     render :action => :edit unless @estudiante.update_attributes(params[:estudiante])
  end

 
  def destroy
    @estudiante = Estudiante.find(params[:id])
    @estudiante.destroy
    @estudiantes = Estudiante.all
  end

  private 
  def find_curso_estudiantes
    @curso = Curso.find(params[:curso_id])
    @estudiante = Estudiante.find(params[:id]) if params[:id]
  end

  private
  def sort_column
    Estudiante.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
