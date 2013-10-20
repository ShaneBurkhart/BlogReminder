class PlannedDatesController < ApplicationController
  before_filter :authenticate_user!

  # GET /dates
  # GET /dates.json
  def index
    @dates = current_user.planned_dates

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dates }
    end
  end

  # GET /dates/1
  # GET /dates/1.json
  def show
    @date = PlannedDate.find(params[:id])

    return unless authorize_planned_date

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @date }
    end
  end

  # GET /dates/new
  # GET /dates/new.json
  def new
    @date = PlannedDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @date }
    end
  end

  # GET /dates/1/edit
  def edit
    @date = PlannedDate.find(params[:id])
    return unless authorize_planned_date
  end

  # POST /dates
  # POST /dates.json
  def create
    @blog = Blog.find(params[:blog_id])
    @date = @blog.planned_dates.build(params[:date])
    @date.attributes = params[:planned_date]

    respond_to do |format|
      if @date.save
        format.html { redirect_to blog_path(params[:blog_id]), notice: 'PlannedDate was successfully created.' }
        format.json { render json: @date, status: :created, location: @date }
      else
        format.html { render action: "new" }
        format.json { render json: @date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dates/1
  # PUT /dates/1.json
  def update
    @date = PlannedDate.find(params[:id])

    return unless authorize_planned_date

    respond_to do |format|
      if @date.update_attributes(params[:planned_date])
        format.html { redirect_to blog_path(@date.blog.id), notice: 'Date was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dates/1
  # DELETE /dates/1.json
  def destroy
    @date = PlannedDate.find(params[:id])

    return unless authorize_planned_date

    @date.destroy

    respond_to do |format|
      format.html { redirect_to blog_path(params[:blog_id])}
      format.json { head :no_content }
    end
  end

  private

    def authorize_planned_date
      if !current_user.my_planned_date? @date
        redirect_to blogs_path, notice: "You don't have permission to do that!"
        return false
      end
      return true
    end

end
