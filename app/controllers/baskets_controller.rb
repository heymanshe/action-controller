class BasketsController < ApplicationController
  def show
    @basket = Basket.first || Basket.create(total_price: 0)
  end

  def update
    @basket = Basket.first
    if @basket.update(basket_params)
      redirect_to basket_path, notice: "Basket updated successfully"
    else
      render :show
    end
  end

  def destroy
    Basket.destroy_all
    redirect_to basket_path, notice: "Basket cleared"
  end

  private

  def basket_params
    params.require(:basket).permit(:total_price)
  end
end
