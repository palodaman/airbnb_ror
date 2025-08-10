class HomeController < ApplicationController
    def index
        @properties = Property.all 
        #this is a rails convention to use @ for instance variables%>

    end
end