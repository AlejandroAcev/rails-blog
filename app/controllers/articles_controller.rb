class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "El articulo ha sido publicado correctamete" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render :json, @article.errors, status: :unprocessable_entity }
      end
    end

  end

  def update

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "El articulo ha sido actualizado correctamete" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render :json, @article.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "El articulo ha sido eliminado correctamete" }
      format.json { head :no_content }
    end

  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :user_id)
    end


end