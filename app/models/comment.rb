class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :poster_name, type: String
  field :body, type: String

  embedded_in :post

  # f.fields_for in show.html
  # update params in comments_controller
  def date_added
  	self.created_at.localtime.strftime("%-m/%-d | %l:%M %p")
  	# created_at is a method from Mondoid:Timestamps
  end

  #validating body is present
  validates :body, presence: true

end
