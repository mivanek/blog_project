require 'spec_helper'

describe "Articles" do

  subject { page }
  before(:each) do
    @article = FactoryGirl.create(:article)
  end

  describe "Home page" do
    before { visit root_path }

    it "should have the first blog post title" do
      should have_selector('h2', text: @article.title)
    end

    it "should have an article body" do
      should have_selector('p', text: @article.body)
    end
  end

  describe "New article page" do
    before { visit new_article_path }

    it "should have a 'New article' heading" do
      should have_selector('h1', text: "New article")
    end

    it "should have a 'Submit' button" do
      should have_button("Submit")
    end

    it "should have a 'Cancel' button" do
      should have_button('Cancel')
    end

    describe "new post creation" do

      describe "with invalid input" do
        it "should not create a new post" do
          expect { click_button "Submit"}.not_to change(Article, :count)
        end
      end

      describe "with valid input" do
        before do
          fill_in "Article title",    with: "New blog post"
          fill_in "Article",          with: "Lorem ipsum etc."
        end

        it "should create a new post" do
          expect { click_button "Submit" }.to change(Article, :count).by(1)
        end
      end
    end
  end

  describe "Edit post" do
    before { visit edit_article_path(@article) }

    describe "with invalid input" do
      before { fill_in "Article title", with: "" }

      describe "should not edit a post" do
        before { click_button "Submit" }
        it { should have_selector('div.alert.alert-error',
                                  text: "Updating article failed!") }
      end
    end

    describe "with valid input" do
      before { fill_in "Article", with: @article.body + "test motherfucker" }

      describe "should edit a post" do
        before { click_button "Submit" }
        it { should have_selector('div.alert.alert-success',
                                  text: "Blog post successfully updated") }
      end
    end
  end

  describe "Show article" do
    before { visit article_path(@article) }
    it { should have_selector('h1', text: @article.title) }
    it { should have_selector('p', text: @article.body) }
  end
end
