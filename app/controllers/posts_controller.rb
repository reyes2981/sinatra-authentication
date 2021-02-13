class PostsController < ApplicationController

    get '/posts' do
        "A list of publically available posts"
    end

    get '/posts/new' do
        # checking if they are logged in
        if !logged_in? 
            redirect "/login" # redirect to log in page if user is not logged in
        else
            "A new post form" # rendering if user is logged in
        end
    end

    get '/posts/:id/edit' do
        # checking if they are logged in
        if !logged_in? 
            redirect "/login" # redirect to log in page if user is not logged in
        else
            #how do I find the post that only the author user is allowed to see
            if post = current_user.posts.find(params[:id])
            "An edit post form #{current_user.id} is editing #{post.id}" # rendering if user is logged in
            else
                redirect '/posts'
            end
        end
    end
end