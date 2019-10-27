class ProductController < ApplicationController
    def index
        render json: { 
            code: 200,
            msg: "Success", 
            data: {
                name: "Belanja Api Demo",
                version: "1.0.0"
            } 
            }, status: :ok
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            render json: {
                code: 200,
                msg: "Success",
                data: {
                    name: params[:name],
                    price: params[:price],
                    image: params[:image],
                    id: @product.id
                }
            }
        end
    end

    def show_all
        @product = Product.all
        render json: {  
            code: 200,
            msg: "Success",
            data: @product
        }
    end

    def show_by_id
        @product = set_product
        render json: { 
            code: 200,
            msg: "Success",
            data: {
                name: @product.name,
                price: @product.price,
                image: @product.image,
                id: @product.id
            } 
        }
    end

    def update
        @product = set_product
        if @product.update(product_params)
            render json: {
                code: 200,
                msg: "Success",
                data: {
                    name: params[:name],
                    price: params[:price],
                    image: params[:image],
                    id: @product.id
                }
            }
        end
    end

    def delete
        @product = set_product
        if @product.destroy
            render json: {
                code: 200,
                msg: "Success",
                data: []
            }
        end
    end

    def product_params
        params.permit(:name, :price, :image)
    end
    
    def set_product
        @product = Product.find(params[:id])
    end
end
