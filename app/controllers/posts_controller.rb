class PostsController < ApplicationController

    before_action :authenticate_user!

    def new
        @post = Post.new
    end

    def index
        if params[:search] == nil
            @posts= Post.all
        elsif params[:search] == ''
            @posts= Post.all
        else
            #部分検索
            @posts = Post.where("time LIKE ? ",'%' + params[:search] + '%')
        end
    end

    def create
        post = Post.new(post_params)

        post.user_id = current_user.id 

        if post.save
            redirect_to :action =>"index"
        else
            redirect_to :action =>"new"
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
          redirect_to :action => "show", :id => post.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
    end

    private
    def post_params
        params.require(:post).permit(:time,:day,:room,:about)
    end
end
