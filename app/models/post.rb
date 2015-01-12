class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  # from carrierwave
  mount_uploader :image, AvatarUploader #this field will be an image, carrierwave class for Avatars

  embeds_many :comments

  def date_published
  	created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end