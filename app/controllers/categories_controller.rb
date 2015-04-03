class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def new
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to(:action => 'show', :id => @category.id)
    else
      render('index')
    end
  end

  def delete
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private
  def category_params
    params.require(:category).permit(:name, :thumburl)
  end
end
