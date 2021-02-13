class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login.html"
    end

    post '/sessions' do #processes log in of user
        login(params[:email], params[:password]) #login a user with this email
        redirect '/posts'
      end

      get '/logout' do # clear session
        logout!
        redirect '/posts'
      end


end