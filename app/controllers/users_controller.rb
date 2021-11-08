class UsersController < ApplicationController

    get "/login" do
        erb :"users/login"
    end
    
    get "/signup" do
        erb :"users/signup"
    end

    post "/signup" do
        if User.all.find {|user| user.username == params[:username]}
            flash[:message] = "Username already taken"
            redirect "/signup"
        elsif !valid_username?(params[:username])
            flash[:message] = "Username is invalid"
        elsif !valid_email?(params[:email])
            flash[:message] = "Invalid email"
        # elsif 


        end
    end

    helpers do
        def valid_username?(username)
            (username =~ /\A[a-z0-9_]{4,16}\z/) == 0
        end

        def valid_email?(email)
            (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i) == 0
        end
    end
    


end
