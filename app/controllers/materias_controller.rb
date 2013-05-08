class MateriasController < ApplicationController

  before_filter :require_login

  load_and_authorize_resource :only => [:new, :edit, :destroy] 

  helper_method :sort_column, :sort_direction

  def index
    #@materias = Materia.order(params[:sort])
    #@materias = Materia.search(params[:search]).page(params[:page]).per_page(2) (buscador por registros determinados)
    @rxp = (params[:registro])? params[:registro].to_i : 3
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
   #@materias = Materia.search(params[:search]).page(params[:page]).per_page(@rxp)
    @materias = Materia.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(@rxp)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materias }
    end
  end


  def show
    @materia = Materia.find(params[:id])
  end


  def new
    @materia = Materia.new
  end

 
  def edit
    @materia = Materia.find(params[:id])
  end


  def create
    @materia = Materia.new(params[:materia])
    render :action => :new unless @materia.save
  end


  def update
    @materia = Materia.find(params[:id])
    render :action => :edit unless @materia.update_attributes(params[:materia])
  end

  
  def destroy
    @materia = Materia.find(params[:id])
    @materia.destroy
  end

  private
  
  def sort_column
    Materia.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
