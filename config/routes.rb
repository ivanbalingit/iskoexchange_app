=begin
    Description : Routes file for the whole website
    Copyright (C) 2018  Luis Tan & Ivan Balingit

    This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2015-2016
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see https://www.gnu.org/licenses/.

     **CHANGELOG**
     Luis Tan 2/2/18 - Added routes for questions 
     Luis Tan 2/9/18 - Added License
     Ivan Balingit 2/14/18 - Add routes for showing user profiles
     Ivan Balingit 2/17/18 - Add route for searching questions
     Luis Tan 2/14/18 - Added routes for answer
     Ivan Balingit 2/21/18 - Add routes for replies
     Ivan Balingit 2/22/18 - Add routes for edit and update user
     Ivan Balingit 3/22/18 - Add routes for tag searching
     Luis Tan 3/22/18 - Added links for report and vote features

     File created on: 1/26/18
     Developer: Ivan Balingit & Luis Tan
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end
Rails.application.routes.draw do
  resources :questions
  resources :answers
  resources :users, only: [:show, :edit, :update]
  resources :replies

  get '/answers/:id/report(.:format)' => 'answers#report', as: 'report_answer'
  get '/replies/:id/report(.:format)' => 'replies#report', as: 'report_reply'

  get '/notification/readAll' => 'notifications#readAll', as: 'notifications_read_all'
  get '/notification/' => 'notifications#index', as: 'notifications' 

  get '/answers/:id/upvote(.:format)', to: 'votes#upvote', as: 'votes_upvote'

  get '/search' => 'questions#search'

  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'tags/:tag', to: 'tags#show'

  root 'home#index'
end
