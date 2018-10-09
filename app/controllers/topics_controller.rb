class TopicsController < ApplicationController
  before_action :set_topic,  only: [:show, :edit, :update, :destroy]
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user,  except: [:index, :show]
  before_action :authorize_admin_or_moderator, only: [:update]
 
  def index
      @topics = Topic.all
    end

    def show
    end

    def new
     @topic = Topic.new
      @sponsoredpost = SponsoredPost.new
    end

    def create
      @topic = Topic.new(topic_params)

      if @topic.save
        redirect_to @topic, notice: "Topic was saved successfully."
      else
        flash.now[:alert] = "Error creating topic. Please try again."
        render :new
      end
    end
    
   def edit
   end

    def update
       #@topic.update(topic_params)
       @topic = Topic.find(params[:id])
       @topic.assign_attributes(topic_params)

        if @topic.save
            flash[:notice] = "Topic was updated."
          redirect_to  @topic
        else
          flash.now[:alert] = "Error saving topic. Please try again."
          render :edit
        end
    end

    def destroy
 
     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
     end
   end

   private 

   def set_topic
      @topic = Topic.find(params[:id])
   end

   def topic_params
    params.require(:topic).permit(:name,
                                  :description,
                                  :public
    )
   end
    def authorize_user
     unless current_user.admin? 
       flash[:alert] = "You must be an admin to do that."
       redirect_to topics_path
     end
   end

    def authorize_admin_or_moderator
    post = Post.find(params[:id])
     unless ( current_user.admin? || current_user.moderator?)
      flash[:alert] = "You must be an admin or moderator to do that."
      redirect_to topics_path
    end
  end
end
