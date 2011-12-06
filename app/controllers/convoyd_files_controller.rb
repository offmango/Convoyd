class ConvoydFilesController < ApplicationController
  # GET /convoyd_files
  # GET /convoyd_files.json
  def index
    @convoyd_files = ConvoydFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @convoyd_files }
    end
  end

  # GET /convoyd_files/1
  # GET /convoyd_files/1.json
  def show
    @convoyd_file = ConvoydFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @convoyd_file }
    end
  end

  # GET /convoyd_files/new
  # GET /convoyd_files/new.json
  def new
    @convoyd_file = ConvoydFile.new
    @user = User.find(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @convoyd_file }
    end
  end

  # GET /convoyd_files/1/edit
  def edit
    @convoyd_file = ConvoydFile.find(params[:id])
  end

  # POST /convoyd_files
  # POST /convoyd_files.json
  def create
    @convoyd_file = ConvoydFile.new(params[:convoyd_file])
    @user = User.find(params[:user_id])

    if @convoyd_file.save
      redirect_to user_path(@user), :notice => 'Convoyd file was successfully created.'
    else
      render action: "new" 
    end
  end

  # PUT /convoyd_files/1
  # PUT /convoyd_files/1.json
  def update
    @convoyd_file = ConvoydFile.find(params[:id])

    respond_to do |format|
      if @convoyd_file.update_attributes(params[:convoyd_file])
        format.html { redirect_to @convoyd_file, notice: 'Convoyd file was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @convoyd_file.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @convoyd_file = ConvoydFile.find(params[:id])
    @user = User.find(params[:user_id])
    @convoyd_file.destroy

    redirect_to user_path(@user)
  end
end
