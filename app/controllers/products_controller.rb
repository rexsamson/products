class ProductsController < ApplicationController
    before_action :require_login
    before_action :find_product, only:[:destroy]
    
    def edit
      
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        
        if @product.save
            flash[:success] = "Product data created successfully!"
            redirect_to products_path
        else
            render 'new'
        end
    end
    
    def destroy
        @product.destroy
        flash[:warning] = "Product data deleted successfully!"
        redirect_to products_path
    end
    
    def update
        if @product.update(product_params)
            flash[:success] = "Product data updated successfully!"
            redirect_to products_path
        else
            render 'edit'
        end
    end
    
    def index
        
       
        @products= Product.all
        if params[:search] and params[:search2]
            @products = Product.search(params[:search], params[:search2]).paginate(page: params[:page], per_page: 30)
        else
            @products = Product.paginate(page: params[:page], per_page: 30)
        end
    end
    
    private
    
    def find_product
        @product = Product.find(params[:id])
    end
    
    def product_params
        params.require(:product).permit(
            :title, 
            :category, 
            :image,
            :slug
        )
    end
    

end