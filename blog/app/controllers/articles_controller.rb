class ArticlesController < ApplicationController
    before_action :authenticate_user!,except: [:show,:index]
    load_and_authorize_resource
   
    
    def new 
           
            @article = Article.new    
    end
    def create
        
        @article=Article.new(article_params.merge(user_id:current_user.id))
        if @article.user
            @article.user = current_user
        end    
        if @article.save
            redirect_to @article
        else
            render 'new' 
            
        end   
    end  
    
    def show
        @article=Article.find(params[:id]) 
    end  
    
    def index
        @articles=Article.all

    end   

    def edit
        @article=Article.find(params[:id])
    end  
    def update
        @article = Article.find(params[:id])
        
        if @article.update(params.require(:article).permit(:title, :text))
          redirect_to @article
        else
          render 'edit'
        end
      end  
      def destroy
        @article = Article.find(params[:id])
        @article.destroy
     
        redirect_to articles_path
      end
      private
    def article_params
      params.require(:article).permit(:title, :text)
    end
      
end
