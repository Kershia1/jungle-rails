class Admin::CategoriessController < ApplicationController

  def index
    @categories = Categories.order(id: :desc).all
  end

  def new
    @categories = Categories.new
  end

  def create
    @categories = Categories.new(categories_params)

    if @categories.save
      redirect_to [:admin, :categoriess], notice: 'categories created!'
    else
      render :new
    end
  end

  def destroy
    @categories = Categories.find params[:id]
    @categories.destroy
    redirect_to [:admin, :categoriess], notice: 'categories deleted!'
  end

  private

  def categories_params
    params.require(:categories).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
