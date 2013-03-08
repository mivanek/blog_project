class Article < ActiveRecord::Base
  attr_accessible :body, :title
  validates :title, :body, presence: true

  default_scope order: 'articles.created_at DESC'
end
