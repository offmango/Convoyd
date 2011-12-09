class ConvoydFilesController < ApplicationController
    
  
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
    if @convoyd_file.requires_password? && !@convoyd_file.authenticated?(session[:file_id])
      redirect_to authenticate_for_file_path(@convoyd_file)
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
  
  
  def download
    @convoyd_file = ConvoydFile.find(params[:id])
    redirect_to @convoyd_file.upload.expiring_url(10)
  end
  
  
  def authenticate
    @convoyd_file = ConvoydFile.find(params[:id])
  end
  
  def check_authentication
    @convoyd_file = ConvoydFile.find(params[:id])
    if @convoyd_file.password_authentic?(params[:password])
       session[:file_id] = @convoyd_file.id
       redirect_to convoyd_file_path(@convoyd_file)
     else
       redirect_to authenticate_for_file_path(@convoyd_file), :notice => 'Authentication failed!'
    end
  end
  
  
end
