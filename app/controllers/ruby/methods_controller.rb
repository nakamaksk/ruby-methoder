class Ruby::MethodsController < ApplicationController
  before_action :set_ruby_method, only: %i[ show edit update destroy ]

  # GET /ruby/methods or /ruby/methods.json
  def index
    @ruby_methods = Ruby::Method.all
  end

  # GET /ruby/methods/1 or /ruby/methods/1.json
  def show
  end

  # GET /ruby/methods/new
  def new
    @ruby_method = Ruby::Method.new
  end

  # GET /ruby/methods/1/edit
  def edit
  end

  # POST /ruby/methods or /ruby/methods.json
  def create
    @ruby_method = Ruby::Method.new(ruby_method_params)

    respond_to do |format|
      if @ruby_method.save
        format.html { redirect_to @ruby_method, notice: "Method was successfully created." }
        format.json { render :show, status: :created, location: @ruby_method }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ruby_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruby/methods/1 or /ruby/methods/1.json
  def update
    respond_to do |format|
      if @ruby_method.update(ruby_method_params)
        format.html { redirect_to @ruby_method, notice: "Method was successfully updated." }
        format.json { render :show, status: :ok, location: @ruby_method }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ruby_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruby/methods/1 or /ruby/methods/1.json
  def destroy
    @ruby_method.destroy
    respond_to do |format|
      format.html { redirect_to ruby_methods_url, notice: "Method was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruby_method
      @ruby_method = Ruby::Method.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ruby_method_params
      params.require(:ruby_method).permit(:name, :ruby_class_id, :pattern)
    end
end
