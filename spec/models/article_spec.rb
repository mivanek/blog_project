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

require 'spec_helper'

describe Article do

    let(:user) { FactoryGirl.create(:user) }
    before { @article = user.articles.build(title: "Test blogpost",
                                            body: "This is a test article") }

    subject { @article }

    it { should respond_to(:title) }
    it { should respond_to(:body) }

    it { should be_valid }

    describe "without title" do
      before { @article.title = " " }
      it { should_not be_valid }
    end

    describe "without body" do
      before { @article.body = " " }
      it { should_not be_valid }
    end

end
