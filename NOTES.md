
## Notes for myself
  <li><%= display_user(post) %> - <%= link_to post.title, user_post_path(post) %></li>

  <% @user.posts.each do |post| %>
       <% post.images.each do |image| %>
         <%= carousel_for(post.images) %>
        <% end %>
   <% end %>

       <% @user.posts.each do |post| %>
        <div class="card-deck">
         <div class="card ">
           <div  class="card-img-top" >
           <div class="card-header">
             <li><%= link_to post.title, user_post_path(@user, post) %></li>
           </div>
           <div class="card-body">
             <%= image_tag post.images.first if post.images.attached? %>
           </div>
         </div>
         </div>
             </div>
       <% end %>




* **get google/facebook or signup/signin** [x]
* **password_confirmation** [x]  authenticate
* **authenticate** [x]
* **helpers** [x]
* **delete post_img & user-img in Database** [x]
* **use layouts & partials** [x]

## CSS
* login page **[x]**
* sign up page **[x]**
* 404 page **[x]**
* User Dashboard **[x]**


## Done
* welcome page = login in, sign up *[√]*
  * put all this in NOTE.md  [√]
  * Post index show pages *[√]*
  * upload pictures *[√]*
  * upload post *[√]*
  * tags work  *[√]*
  * loging in *[√]*
  * sign up *[√]*
  * logging out *[√]*


**Extra**
  * •search page **[x]**

## GEMS
  * *Bootsrap* **[√]**
  * *Pagination - Kaminari gem* **[x]**
  * *JQuery* **[√]**

  https://www.toptal.com/ruby-on-rails/rails-helper-bootstrap-carousel

bootstrap/
https://medium.com/@adrian_teh/ruby-on-rails-6-with-webpacker-and-bootstrap-step-by-step-guide-41b52ef4081f
  https://gorails.com/forum/install-bootstrap-with-webpack-with-rails-6-beta


 https://www.layoutit.com/build
