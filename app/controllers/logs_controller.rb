class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /logs
  # GET /logs.json
  def index
    # @date = Date.today.strftime("%F")
    @date = params[:date] || Date.today
    @logs = Log.where("date = ?", @date).order(:time)
    @total_time = Log.where("date = ?", @date).sum :length
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
    @user = current_user
    @date = params[:date] || Date.today
    @set_time = Time.zone.now.strftime("%I:%M %p")
    @set_date = @date || Date.today.strftime("%F")
    @customerlist = Customer.all.order(:name).map { |u| ["#{u.name} - #{u.city}, #{u.state} - #{u.kc_cust_id}", u.id] }
  end

  # GET /logs/1/edit
  def edit
    @date = params[:date] || Date.today
    @set_time = @log.time.strftime("%I:%M %p")
    @set_date = @log.date.strftime("%F")
    @customerlist = Customer.all.order(:name).map { |u| ["#{u.name} - #{u.city}, #{u.state} - #{u.kc_cust_id}", u.id] }
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = Log.new(log_params)

    if @log.save
      redirect_to logs_path, notice: 'Log was successfully created.'
    else
      format.html { render action: 'new' }
      format.json { render json: @log.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to action: "index", notice: 'Log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:case_type, :person, :customer_id, :description, :length, :followup, :followup_note, :user_id, :app_note, :date, :time, :tag_ids => [])
    end
end
