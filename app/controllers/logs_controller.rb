class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /logs
  # GET /logs.json
  def index
    @date = params[:date] || Date.today
    @log = Log.new
    @logs = Log.where("date = ?", @date).order('time DESC')
    @followups_w_date = Log.where(user_id: current_user.id, followup: 2).where("followup_due_date <= ?", Date.today).order('followup_due_date ASC')
    @followups_no_date = Log.where(user_id: current_user.id, followup: 2, followup_due_date: nil)
    @total_time = Log.where("date = ?", @date).sum :length
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
    @date = params[:date] || Date.today
    @logs = Log.where("date = ?", @date).order('time DESC')
    @user = current_user
    @customerlist = Customer.all.order(:name).map { |u| ["#{u.name} - #{u.city}, #{u.state} - #{u.kc_cust_id}", u.id] }
    @set_date = Date.today
    @set_time = Time.zone.now.strftime("%I:%M %p")
  end

  # GET /logs/1/edit
  def edit
    @date = params[:date] || Date.today
    @set_time = @log.time.strftime("%I:%M %p")
    @set_date = @log.date.strftime("%F")
    @customerlist = Customer.all.order(:name).map { |u| ["#{u.name} - #{u.city}, #{u.state} - #{u.kc_cust_id}", u.id] }
    @logs = Log.where("date = ?", @date).order('time DESC')
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = Log.new(log_params)

    if params[:commit] == 'Save & Close'

      respond_to do |format|
        if @log.save
          format.html { redirect_to logs_path, notice: 'Log was successfully created.' }
        else
          format.html { render action: 'new' }
        end
        format.js
      end

    elsif params[:commit] == 'Save'

      respond_to do |format|
        if @log.save
          format.html { redirect_to edit_log_path(@log.id), notice: 'Log was successfully created.' }
        else
          format.html { render action: 'new' }
        end
        format.js
      end

    end

  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    @log = Log.find(params[:id])

    respond_to do |format|
      if @log.update_attributes(log_params)
        format.html { redirect_to action: "index", notice: 'Log was successfully updated.' }
        format.json { head :no_content } # 204 No Content
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   if params[:commit] == 'Save & Close'
  #     if @log.update(log_params)
  #       redirect_to action: "index", notice: 'Log was successfully updated.'
  #     else
  #       render action: 'edit'
  #     end
  #   elsif params[:commit] == 'Save'
  #     if @log.update(log_params)
  #       redirect_to edit_log_path(@log.id), notice: 'Log was successfully updated.'
  #     else
  #       render action: 'edit'
  #     end
  #   end
  # end

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
      params.require(:log).permit(:case_type, :person, :customer_id, :description, :length, :followup, :followup_note, :followup_due_date, :user_id, :app_note, :date, :time, :tag_ids => [])
    end
end