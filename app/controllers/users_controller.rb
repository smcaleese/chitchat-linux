class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @user = current_user
        @pages = Page.all
    end
end
