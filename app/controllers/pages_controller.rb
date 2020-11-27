class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
        @pages = Page.all
    end

    def show
        # @page = Page.find(params[:id])
        # render text: @page.title
    end

    def new
        @page = Page.new
    end

    def create
        # @page = Page.new(params)
        # render text: params.to_json
        # render text: params.class
        @page = Page.new(page_params)
        @page.save
        redirect_to @page
    end
    
    def edit
    end

    def update 
        @page.update(page_params)
        redirect_to @page
    end

    def destroy
        @page.destroy
        redirect_to pages_path
    end

    # Private allows no one else to access this code
    private

    def set_page 
        @page = Page.find(params[:id])
    end

    def page_params
        params.require(:page).permit(:title, :body, :slug)
    end

end
