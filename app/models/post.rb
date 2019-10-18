class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags


# accepts_nested_attributes_for :tags

  # customize the way our tag is created
  #creating a new tag if it doesn't already exist with the current name
  #a writer, which takes in a parameter (tags_hashes) and makes it
  #into an instance variable that can be used by any instance of the class Post.
  def tags_attributes=(tags_hashes) #writer
    #{"0"=>{"name"=>"new tag 1"}, "1"=>{"name"=>"new tag 2"}}

    #How would I create a tag for each of the hashes inside tags_hashes
    tags_hashes.values.each do |tag_attributes|

      #DO NOT CREATE A TAG IF IT DOESN'T HAVE NAME
      #if tag_attributes[:name].present?

        #create a new tag if this post doesn't already have this tag
        #find or create the tag regardless of whether this post has it.
        tag = Tag.find_or_create_by(tag_attributes)
        #ALSO DON'T DUPLICATE POST IF IT ALREADY HAVE IT.
        #How do i check if this post has this tag already?
        if !self.tags.include?(tag)
          #this is ineffecient because it will pull all tags
          #self.tags << tag 47:55
          self.post_tags.build(:tag => tag)

          #I need to create a tag that is already associated with this post
          # and i need to make sure that this tag already doesn't exist by name.
        end
      end
    end

  end
