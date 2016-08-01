class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  #if user is authenticated then show everything; otherwise send user back to the
  #index
  
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new

  def new
    #Build is a method provided by Rails.  It's an alias of new.
    #Read more about it here: http://stackoverflow.com/questions/19761766/build-method-on-ruby-on-rails
    @link = current_user.links.build
  end


  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.build(link_params)
    #link_params is a helper method that scaffold provides.  See below
    #If you don't use scaffold, then you should code this helper  manually

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
      @link = Link.find(params[:id])
      #upvote_by is a method provided by gem acts_as_votable
      #current_user is a method provided by gem devise
      @link.upvote_by current_user
      redirect_to :back
    end

    def downvote
      @link = Link.find(params[:id])
      @link.downvote_by current_user
      redirect_to :back
    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
