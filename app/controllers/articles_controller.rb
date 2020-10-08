class ArticlesController < ApplicationController
    
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
        
    end

    def new

    end

    def create
        @user_article = Article.new(params.require(:article).permit(:title, :description)) #rails shortcut
        
				if @user_article.save
				  	
				end
					
            redirect_to @user_article
        else
            render 'new'
        end
    end
end