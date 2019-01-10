class CommentsController < ApplicationController
    before_action :authenticate_user! 
    
    def create
        @page = Page.find(params[:page_id])
        @comment = @page.comments.create(comment_params)
        
        @comment.user = current_user
        
        if @comment.save
            redirect_to page_path(@page)
        else 
            render 'new' 
        end
    end
    
    def destroy 
        @page = Page.find(params[:page_id])
        @comment = @page.comments.find(params[:id])
        @comment.destroy
        redirect_to page_path(@page)
    end
    
    private
    def comment_params
        params.require(:comment).permit(:body)
    end
end
