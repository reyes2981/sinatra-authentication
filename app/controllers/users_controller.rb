class UsersController < ApplicationController # inherits from Application Controller class

    get '/signup' do
        erb :"users/new.html"
    end

    post '/users' do 
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect '/login'
        else
            erb :'users/new.html'
        end
    end

end