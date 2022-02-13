# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

Ruby 2.6.5 [x86_64-linux]

Rails 5.2.6

* System dependencies

Gems used :
-------------

gem 'image_processing', '~> 1.2'

gem 'jquery-rails', '~> 4.4'

gem 'bootstrap', '~> 4.0'

gem 'sprockets-rails', '~> 3.4', '>= 3.4.2'

gem 'font-awesome-sass', '~> 5.15.1'

gem 'carrierwave', '~> 2.0'

gem "jquery-datatables", "~> 1.10"

gem "faker", "~> 2.19"

gem 'country_select', '~> 6.0'

gem 'mini_magick', '~> 4.8'

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

1.Create New Project

//command on terminal //use rails 5.2 and ruby 2.6.5
>> rails new sport_app --database=postgresql
//creates all file for projects

2. open project in vscode
//on terminal

enter project
>> cd project_name/

opens project in vscode
>> code .

3. under config ->> database.yml 
 below pool add username and password of your database

default: &default
 . . . . . . . 
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: mansi
  passsword: psql17 

>> rake db:create
Created database 'sport_app_development'
Created database 'sport_app_test'
>> rails s

check localhost:3000

---------------------------------------------------

add gem in Gemfile
gem 'devise'

termial
>> bundle install

>> rails g devise:install

copypaste point 3 as instructed

 Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>


1>> paste above yeid under application.html.erb

or 

2>> create new file _alerts.html.erb in layouts
and paste it 

write 
<%= render 'layouts/alerts' %>
above yeild

@@@
 run
>> rails g devise User

>>  rails g devise:views

>>  rails g controller pages home

config ->> routes 
change 
get 'pages/home'
to
root to: 'pages#home'

------------------------------------------

>>  rails db:migrate
>> rails s
check localhost:3000

view ->> pages ->> home.html.erb
add line :
<%= link_to 'Sign up', new_user_registration_path %>

restart server if error (NameError)

check localhost:3000

enter data
check sign in , sign out,log in,forgot pass

to add option sign out 
<%= link_to 'Sign Out', destroy_user_session_path , method: :delete %>

check localhost

edit under 
view ->> pages ->> home.html.erb

<h1>HOME</h1>
<p>Welcome to Sport Blog</p>

<% if current_user %>
<%= link_to 'Sign Out', destroy_user_session_path , method: :delete %>

<% else %>
<%= link_to 'Sign Up', new_user_registration_path %>
<br/>
<%= link_to 'Sign In', new_user_session_path %>
<% end %>

--------------------------------------

for admin

>> rails g migration add_admin_to_user admin:boolean

 edit under
db -->> migrate -->  AddAdminToUser


class AddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end

>>  rails db:migrate



dell@mp:~/Documents/Rails-Exercise/sport_app$ rails c
Running via Spring preloader in process 29851
Loading development environment (Rails 5.2.6)
2.6.5 :001 > @user.admin = true
Traceback (most recent call last):
        1: from (irb):1
NoMethodError (undefined method `admin=' for nil:NilClass)
2.6.5 :002 > @user = User.first
  User Load (0.5ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT $1  [["LIMIT", 1]]
 => #<User id: 1, email: "mansi123@gmail.com", created_at: "2022-02-07 09:32:44", updated_at: "2022-02-07 09:32:44", admin: false> 
2.6.5 :003 > @user.admin = true
 => true 
2.6.5 :004 > @user.save
   (0.4ms)  BEGIN
  User Update (0.5ms)  UPDATE "users" SET "updated_at" = $1, "admin" = $2 WHERE "users"."id" = $3  [["updated_at", "2022-02-07 09:55:53.436767"], ["admin", true], ["id", 1]]
   (0.8ms)  COMMIT
 => true 
2.6.5 :005 > 

--------------------------------------------------

rails s

if error 
>> rake db:migrate

rails s

models ->> user.rb
edit
 if avatar.attached?
      avatar.variant(resize: '150x150').processed
 else
      "/default_profile.jpg"
 end

edit under
view ->> pages ->> home.html.erb
<% if current_user %>
<p>
   <%= link_to 'Sign Out', destroy_user_session_path , method: :delete %>
</p>

<p>
   <%= link_to "Edit Account", edit_user_registration_path%>
</p>

<p>
   <%= image_tag(current_user.avatar_thumbnail) %> 
</p>

<% else %>

--------------------------------------

>> rails active_storage:install

edit under and add line for avatar
models ->> user.rb

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
end

@@@

for avatar

edit under
app ->> controllers ->> application_controller.rb
add lines


class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,
         if: :devise_controller?


        protected 

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:signup, keys: [:avatar])
            devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
        end
end


edit under
devise ->> registrations -->> edit.html.erb
add this above email div


  <div class="field">
    <%= image_tag(resource.avatar_thumbnail) if  resource.avatar.attached? %>
  </div>


add gem to gemfile
gem 'image_processing', '~> 1.2'

>> bundle
>> sudo apt-get install imagemagick

add line below image_tag div......edit under 
devise ->> registrations ->> edit.html.erb

  <div class="field"> 
    <%= f.file_field :avatar %>
  </div>

devise ->> registrations ->> new.html.erb
edit ...add lines below render


  <div class="field">
    <% if resource.avatar.attached? %>
      <%= image_tag(resource.avatar)%>
    <% else %>
      <%= image_tag("/default_profile.jpg") %>
    <% end %>
  </div>

drag image to 
asset ->> images 
rename with  default_profile.jpg

app-views-pages-home.html.erb
edit 

<% if current_user %>
<p>
   <%= link_to 'Sign Out', destroy_user_session_path , method: :delete %>
</p>

<p>
   <%= link_to "Edit Account", edit_user_registration_path%>
</p>

<p>
   <%= image_tag(current_user.avatar_thumbnail) if current_user.avatar.attached? %> 
</p>

<% else %>
------------------------------------------------------------

edit under
models ->> user.rb

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  
  after_commit :add_default_avatar, on: %i[create update]

  # force size 
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '150x150').processed
    else
      "/default_profile.jpg"
    end
  end

  private
 def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app','assets','images','default_profile.jpg'
          )
        ), filename: 'default_profile.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end



check localhost enter data 
default image will be automatically viewed



-----------------------------------------------

create scaffold for sport

>> rails g scaffold sport sport_name sport_equipement:text user:references
>> rails db:migrate
>> rails s

app ->> views ->> pages ->> home.html.erb
add line at last after end of if
this will link user pager with sport scaffold

<%= link_to 'Sports', sports_path %>

check localhost


delete the unwanted user id field div
app ->> views ->> sports ->> _form.html.erb

app -> controllers -> sports_controller.rb

---remove user id from 

private
def sport_params 
end

---  add this line below 
 def create
    @sport = Sport.new(sport_params)
    @sport.user = current_user
    [ -------------------------------]
end

--- add line  
   before_action :authenticate_user!, except: [ :show, :index ]

like below

class SportsController < ApplicationController
  before_action :set_sport, only: %i[ show edit update destroy ]
 
  before_action :authenticate_user!, except: [ :show, :index ]
---- 
app -> views -> sports -> show.html.erb
 delete this line
  before_action :authenticate_user!, except: [ :show, :index ]

edit 

<p>
  <strong>User:</strong>
  <%= @sport.user.email.split('@')[0].capitalize %>
</p>

---------------------------------------------

add line 
app -> models -> post.rb

has_many_attached :images


add image in params
controller -> post_controller

 def post_params
      params.require(:post).permit(:title, :description, images: [], :tag, :user_id)
 end

edit under post-> _form.html.erb

  <div class="field">
    <%= form.label :image %>
    <%= form.text_field :images, multiple: true %>
  </div>


--------------------------------------------------

Post

>> rails g scaffold post sport_name:string title:string image:string description:text tag:string user:references
>> rails db:migrate

check locallost

Edit user ID as mentioned in Note 6

for comment
 >> rails g model Comment name:string body:text post:references

check model and controllers for post and comments
app -> models -> post.rb
edit like below add association line
  has_many :comments

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
end

-----------
change route for post to print comment on same page
do nested routes

  resources :posts do
    resources :comments
  end

to check do
>> rails routes 

-----------

>> rails g controller Comments

app -> controllers -> comments_controller.rb
edit and add lines as below


class CommentsController < ApplicationController
   def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(params[:comment].permit(:name,       :body))
      redirect_to post_path(@post)
    end
end

---------------------------------------------------

for comments

in view -> comments -> make 2 file 
_form.html.erb
_comment.html.erb

under _form.html.erb

write

<%= form_for([@post,@post.comments.build]) do |f| %>
 <p>
     <%= f.label :name %>
     <%= f.text_field :name %>
 </p>
 <br/>
 <p>
    <%= f.label :body %>
    <%= f.text_area :body %>
 </p>
 <br/>
 <p>
     <%= f.submit %>
 </p>

 <% end %>

>> rake db:migrate

under _comment.html.erb
add lines 


<%= comment.name %>
<%= comment.body %>
<%= time_ago_in_words(comment.created_at) %>


----------------------------------------------------------

to delete voilent comment

app -> controller -> comments_controller.rb

add method to destroy comment

  def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
    
    
views -> comments -> _comment.html.erb

edit
-------------------------------------------------------------

Tags

>> rails g model Tag name:string
>> rake db:migrate

>> rails g migration CreatePostsTags post:references tag:references


db -> migrate -> migration CreatePostsTags 
edit line

create_table :posts_tags, :id => false do |t|
>> rake db:migrate


app -> models -> post.rb
add line

has_and_belongs_to_many :tags

app -> models -> tags.rb
add line

class Tag < ApplicationRecord
    has_and_belongs_to_many :posts
end
---------------------------------
app -> models -> post.rb

add lines

  #callbacks
  #after user creates post we do this
  after_create do
    #find post added
    post = Post.find_by(id: self.id)
    hashtags = self.tag.scan(/#\w+/)
    #fetch hashtags #uniq to restrict duplicate hashtags
    hashtags.uniq.map do |hashtag|
      #find specific tag does exists create or dnt 
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      #display all specific tags 
      post.tags << tag 
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.tags.clear #we delete all and add again
    hashtags = self.tag.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      post.tags << tag 
    end
  end

--------------
add route line

get '/posts/hashtag/:name', to:'posts#hashtags'


edit under 
app -> controllers -> posts_controller
add lines

 def hashtags
    tag = Tag.find_by(name: params[:name])
    @posts = tag.posts
  end

--------------------------------------------------

hashtags

in views -> posts
copy index.html code to new file 
edit line

 <td><%= render_with_hashtags(post.tag) %></td>
---------------
helpers -> posts_helper.rb

add method

module PostsHelper
    def render_with_hashtags(tag)
       tag.gsub(/#\w+/){|word| link_to word, "/posts/hashtag/#{word.delete('#')}"}.html_safe
    end
end

not linking need to update


for bootstrap
https://youtu.be/JzdY5tl1-TM


added bootstrap , css and scripts 

-------------------------------------------------------

dropdown

for post

sportname dropdown

 >> rails g migration add_column_sport_id_to_posts sport_id:integer:index
>>  rake db:migrate

in schema check sport_id is added in post table

change
views -> posts -> _form.html.erb

edit sport name field div like below

<div class="field">
    <%= form.label :sport %>
    <%= form.collection_select(:sport_id, Sport.all, :id, :sport_name, { :prompt => 'Select a Sport', :selected => @post.sport_id }, { class: 'form-control' }) %>
  </div>


add sport_id in post_controller params

params.require(:post).permit(:sport_name, :title, :image, :description, :tag, :sport_id)

//////////////////////////

references

gems --
https://rubygems.org/


