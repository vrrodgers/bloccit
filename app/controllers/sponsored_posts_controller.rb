class SponsoredPostsController < ApplicationController
  before_action :set_topic
  before_action :set_sponsoredpost, only: [:show, :edit, :update, :destroy]

  def index
    @sponsoredposts = SponsoredPost.all
  end
  def show
  end

  def new
    @sponsoredpost = SponsoredPost.new
  end

  def create
    @sponsoredpost = SponsoredPost.new(sponsoredpost_params)
    @sponsoredpost.topic_id = @topic.id
    respond_to do |format|
      if @sponsoredpost.save
         format.html { redirect_to topic_sponsored_post_path(@topic, @sponsoredpost), notice: 'Sponsored Post was saved.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
        if @sponsoredpost.update(sponsoredpost_params)
            flash[:notice] = "SponsoredPostc was updated."
          redirect_to @topic
        else
          flash.now[:alert] = "Error saving SponsoredPost. Please try again."
          render :edit
        end
    end

    def destroy
     @sponsoredpost = SponsoredPost.find(params[:id])
 
     if @sponsoredpost.destroy
       flash[:notice] = "\"#{@sponsoredpost.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the SponsoredPost."
       render :show
      end
   end

   private

   def set_topic
     @topic = Topic.find(params[:topic_id])
   end

   def set_sponsoredpost
    @sponsoredpost = SponsoredPost.find(params[:id])
   end

  def sponsoredpost_params
    params.require(:sponsored_post).permit(:title,
                                          :body,
                                          :price,
                                          :topic_id
    )
   end
  
end

