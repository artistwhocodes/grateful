module UsersHelper
  def display_user(post)
    post.user.nil? ? link_to("Add User", edit_post_path(post)) : link_to(user_path(post.user))
  end



end
