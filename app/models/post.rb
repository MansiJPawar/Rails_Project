class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  
  #image
  has_one_attached :image

  # def thumbnail
  #   return self.image.variant(resize: "100x100")
  # end

  #carrier wave
  mount_uploader :image, FileUploader, dependent: :destroy



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

end
