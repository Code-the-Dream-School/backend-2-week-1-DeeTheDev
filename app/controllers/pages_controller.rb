class PagesController < ApplicationController

    def index
        @pages = Page.all
    end

    def show
        # @page = Page.find(params[:id])
        # render text: @page.title
        @page = Page.find(params[:id])
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
        @page = Page.find(params[:id])
    end

    def update 
        @page = Page.find(params[:id])
        @page.update(page_params)
        redirect_to @page
    end

    def destroy
        @page = Page.find(params[:id])
        @page.destroy
        redirect_to pages_path
    end

    # Private allows no one else to access this code
    private

    def page_params
        params.require(:page).permit(:title, :body, :slug)
    end

end
