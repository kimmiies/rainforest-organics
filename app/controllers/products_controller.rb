class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    #this is to use in the form view. This instance does ...
  end

  def create
    @product = Product.new(product_params)
     #whats incoming from the create form. SANITIZED

    if @product.save
      redirect_to products_url
      #add a flash here! "Congratulations you've added a product"
    else
      render :new #this goes back to the form
    end
  end

  def edit
    @product = Product.find(params[:id]) #to use in edit form. Needs to exist to edit
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params) #what's incoming from the edit form. SANITIZED
      redirect_to product_path(@product) #the show page takes an ID, found in params and stored in @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path #index page
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

end
