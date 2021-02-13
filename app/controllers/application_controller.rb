class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "auth_demo_lv"
    end

    helpers do

        def logged_in? # maintain state through this method / the first time this method is called you call current_user
            !!current_user 
        end

        def current_user
            @current_user ||= User.find_by(:email => session[:email]) if session[:email] #if user was able to log in due to email matching session and able to save as an instance variable the logged_in method will return true 
        end

        def login(email, password)
            # check if a user with this email actually exists
            # if so, set the session
            user = User.find_by(:email => email)
             if user && user.authenticate(password) #if statement assignment
                 session[:email] = user.email
            else
                redirect '/login'
            end
        end

        def logout!
            session.clear
        end
    end
end