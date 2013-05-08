class UsersController < ApplicationController

  before_filter :require_login

  load_and_authorize_resource :only => [:new, :edit, :destroy] 

  helper_method :sort_column, :sort_direction

  def index
    @rxp = (params[:registro])? params[:registro].to_i : 3
    if ((@rxp) == 0) or ((@rxp) < 0) then
      @rxp = 1
    end
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => (@rxp), :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end 
  

  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(params[:user])
    render :action => :new unless @user.save
  end


  def update
    @user = User.find(params[:id])
    render :action => :edit unless @user.update_attributes(params[:user])
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end 

  private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "username"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end