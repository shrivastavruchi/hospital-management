class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_visit, only:[:new ,:create,:destroy,:index] 
  layout 'patient'
  # GET /notes
  # GET /notes.json
  def index
    @notes = @visit.notes
  end

  def show
  end

  def new
    @note = Note.new
  end


  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = @visit.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to visit_notes_path(@visit), notice: 'Note was successfully created.' }
        
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find_by_visit_id(params[:visit_id])
    @note.destroy
    respond_to do |format|
      format.html { redirect_to  visit_notes_path(@visit), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def set_visit
       @visit = Visit.find(params[:visit_id])
    end  


    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:date, :time, :progress, :treatment, :user_id, :remarks)
    end
end
