class StudentChatFragmentsController < ApplicationController
  before_action :set_student_chat_fragment, only: %i[ show edit update destroy ]

  # GET /student_chat_fragments or /student_chat_fragments.json
  def index
    @student_chat_fragments = StudentChatFragment.all
  end

  # GET /student_chat_fragments/1 or /student_chat_fragments/1.json
  def show
  end

  # GET /student_chat_fragments/new
  def new
    @student_chat_fragment = StudentChatFragment.new
  end

  # GET /student_chat_fragments/1/edit
  def edit
  end

  # POST /student_chat_fragments or /student_chat_fragments.json
  def create
    @student_chat_fragment = StudentChatFragment.new(student_chat_fragment_params)

    respond_to do |format|
      if @student_chat_fragment.save
        format.html { redirect_to student_chat_fragment_url(@student_chat_fragment), notice: "Student chat fragment was successfully created." }
        format.json { render :show, status: :created, location: @student_chat_fragment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_chat_fragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_chat_fragments/1 or /student_chat_fragments/1.json
  def update
    respond_to do |format|
      if @student_chat_fragment.update(student_chat_fragment_params)
        format.html { redirect_to student_chat_fragment_url(@student_chat_fragment), notice: "Student chat fragment was successfully updated." }
        format.json { render :show, status: :ok, location: @student_chat_fragment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_chat_fragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_chat_fragments/1 or /student_chat_fragments/1.json
  def destroy
    @student_chat_fragment.destroy

    respond_to do |format|
      format.html { redirect_to student_chat_fragments_url, notice: "Student chat fragment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_chat_fragment
      @student_chat_fragment = StudentChatFragment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_chat_fragment_params
      params.require(:student_chat_fragment).permit(:response_type, :chat_text, :student_response)
    end
end
