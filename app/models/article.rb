# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :body, :title
  validates :title, :body, presence: true

  belongs_to :users

  default_scope order: 'articles.created_at DESC'
end
