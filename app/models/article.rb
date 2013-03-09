class Article < ActiveRecord::Base
  attr_accessible :body, :title
  validates :title, :body, presence: true

  belongs_to :users

  default_scope order: 'articles.created_at DESC'
end
