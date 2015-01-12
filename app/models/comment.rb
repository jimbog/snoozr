class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String

  embedded_in :post

  #THIS IS WHERE THE ERROR IS
  # belongs_to :user
  accepts_nested_attributes_for :user

  # f.fields_for in show.html
  # update params in comments_controller
  def date_added
  	self.created_at.localtime.strftime("%-m/%-d/%Y | %l:%M %p")
  	# created_at is a method from Mondoid:Timestamps
  end

  #validating body is present
  validates :body, presence: true

end
