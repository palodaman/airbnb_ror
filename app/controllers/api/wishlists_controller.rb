module Api 
    class WishlistController < ApplicationController
        protect_from_forgery with: :null_session #bypass by default csrf token in rails
        #create, delete, 
        
        def create
            # user_id, property_id
            # save to table
            wishlist = Wishlist.create!(wishlist_params)   
            # return response to api call
            respond_to do |format|
                format.json do
                   render json: wishlist.to_json, status: :ok
                end
            end 
        end

        def destroy
            # id=> need wihslist_id
            # delete from table
            wishlist = Wishlist.find!(params[:id])
            wishlist.destroy();
            # return response from table
             respond_to do |format|
                format.json do
                   render status: :204 #no content
                end
            end 
        end

        private #functions below this will be automatically private

        def wihslist_params
            params.permit(:user_id, property_id)
        end


    end
end
