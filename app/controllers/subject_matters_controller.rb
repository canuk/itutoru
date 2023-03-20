class SubjectMattersController < ApplicationController
  before_action :set_subject_matter, only: %i[ show edit update destroy ]

  # GET /subject_matters or /subject_matters.json
  def index
    @subject_matters = SubjectMatter.all
  end

  # GET /subject_matters/1 or /subject_matters/1.json
  def show
  end

  # GET /subject_matters/new
  def new
    @subject_matter = SubjectMatter.new
  end

  # GET /subject_matters/1/edit
  def edit
  end

  # POST /subject_matters or /subject_matters.json
  def create
    @subject_matter = SubjectMatter.new(subject_matter_params)

    respond_to do |format|
      if @subject_matter.save
        format.html { redirect_to subject_matter_url(@subject_matter), notice: "Subject matter was successfully created." }
        format.json { render :show, status: :created, location: @subject_matter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject_matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_matters/1 or /subject_matters/1.json
  def update
    respond_to do |format|
      if @subject_matter.update(subject_matter_params)
        format.html { redirect_to subject_matter_url(@subject_matter), notice: "Subject matter was successfully updated." }
        format.json { render :show, status: :ok, location: @subject_matter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject_matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_matters/1 or /subject_matters/1.json
  def destroy
    @subject_matter.destroy

    respond_to do |format|
      format.html { redirect_to subject_matters_url, notice: "Subject matter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_matter
      @subject_matter = SubjectMatter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_matter_params
      params.require(:subject_matter).permit(:name, :description)
    end
end
