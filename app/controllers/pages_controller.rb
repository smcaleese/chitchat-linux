class PagesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @users = User.all
    end

    def show
       @page = Page.find(params[:id])
    end

    def new
       @page = Page.new
    end

    def create
        @user = current_user
        @page = @user.pages.create(page_params)

        if @page.save
           redirect_to @page
        else
            render 'new'
        end
    end

    def edit
        @page = Page.find(params[:id])
    end

    def update
        @page = Page.find(params[:id])

        if @page.update(page_params)
           redirect_to @page
        else
            render 'edit'
        end
    end

    def destroy
       @user = current_user
       @page = @user.pages.find(params[:id])

       @page.destroy
       redirect_to users_path
    end

    private
    def page_params
       params.require(:page).permit(:title, :description)
    end
end
