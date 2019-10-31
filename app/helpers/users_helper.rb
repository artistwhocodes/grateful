module UsersHelper
  def display_user(post)
    post.user.nil? ? link_to("Add User", edit_post_path(post)) : link_to(user_posts_path(post.user.name))
  end

end


# def display_user(post)
#   post.user.nil? ? link_to("Add User", edit_post_path(post)) : link_to(user_posts_path(post.user.name))
# end
