# encoding: UTF-8
class MeublogsController < ApplicationController
  before_action :set_meublog, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with name: "carol", password: "1234", except: [:index, :show]
  
  # GET /meublogs
  # GET /meublogs.json
  def index
    @meublogs = Meublog.all
  end

  # GET /meublogs/1
  # GET /meublogs/1.json
  def show
  end

  # GET /meublogs/new
  def new
    @meublog = Meublog.new
  end

  # GET /meublogs/1/edit
  def edit
  end

  # POST /meublogs
  # POST /meublogs.json
  def create
    @meublog = Meublog.new(meublog_params)

    respond_to do |format|
      if @meublog.save
		flash[:sucess] = 'A postagem foi criada com sucesso.'
        format.html { redirect_to @meublog }
        format.json { render :show, status: :created, location: @meublog }
      else
		flash[:danger] = 'Houve um problema ao criar a postagem.'
        format.html { render :new }
        format.json { render json: @meublog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meublogs/1
  # PATCH/PUT /meublogs/1.json
  def update
    respond_to do |format|
      if @meublog.update(meublog_params)
	    flash[:sucess] = 'A postagem foi alterada com sucesso.'
        format.html { redirect_to @meublog }
        format.json { render :show, status: :ok, location: @meublog }
      else
		flash[:danger] = 'Houve um problema ao alterar a postagem.'
        format.html { render :edit }
        format.json { render json: @meublog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meublogs/1
  # DELETE /meublogs/1.json
  def destroy
    @meublog.destroy
    respond_to do |format|
	  flash[:sucess] = 'A postagem foi removida com sucesso.'
      format.html { redirect_to @meublog }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meublog
      @meublog = Meublog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meublog_params
      params.require(:meublog).permit(:title, :text)
    end
end
