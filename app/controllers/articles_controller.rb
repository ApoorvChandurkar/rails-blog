class ArticlesController < ApplicationController
    
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
        
    end

    def new
      @user_article = Article.new
    end

    def create
        @user_article = Article.new(params.require(:article).permit(:title, :description)) #rails shortcut
        
        if @user_article.save
          flash[:notice] = "Article created successfully"
          redirect_to @user_article
				            
        else
            render 'new'
        end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @updated_article = Article.find(params[:id])

      if @updated_article.update(params.require(:article).permit(:title, :description))
        flash[:notice] = "Article updated successfully"
        redirect_to @updated_article

      else
        render 'edit'
      end
    end
end