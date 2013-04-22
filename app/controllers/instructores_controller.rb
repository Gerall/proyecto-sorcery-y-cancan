class InstructoresController < ApplicationController

    helper_method :sort_column, :sort_direction

    def index
        #para rails 3.2.9 hasta 3.2.12(última versión a abril-2013)
        #@instructores = Instructor.search(params[:search]).page(params[:page]).per_page(3)
        @rxp = (params[:registro])? params[:registro].to_i : 3
        if ((@rxp) == 0) or ((@rxp) < 0) then
            @rxp = 1
        end
        @instructores = Instructor.search(params[:search]).page(params[:page]).per_page(@rxp)
        respond_to do |format|
         format.html # index.html.erb
         format.xml { render :xml => @instructores }
        end
    end


    def show
        @instructor = Instructor.find(params[:id])
    end


    def new
        @instructor = Instructor.new

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @instructor }
        end
    end

    def edit
        @instructor = Instructor.find(params[:id])
    end

    def create
        @instructor = Instructor.new(params[:instructor])

        respond_to do |format|
          if @instructor.save
            format.html { redirect_to instructores_path, notice: 'Instructor creado.' }
            format.json { render json: @persona, status: :created, location: @instructor }
          else
            format.html { render action: "new" }
            format.json { render json: @instructor.errors, status: :unprocessable_entity }
          end
        end
    end

    
    def update
        @instructor = Instructor.find(params[:id])
        render :action => :edit unless @instructor.update_attributes(params[:instructor])
    end


    def destroy
        @instructor = Instructor.find(params[:id])
        @instructor.destroy
    end
 
    private
    def sort_column
        Instructor.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
    end
      
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end