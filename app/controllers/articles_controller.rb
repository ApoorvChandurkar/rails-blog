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
     
      @article = Article.find(params[:id])

      if @article.update(params.require(:article).permit(:title, :description))
        flash[:notice] = "Article updated successfully"
        redirect_to @article

      else   
        render 'edit'
      end
    end
end