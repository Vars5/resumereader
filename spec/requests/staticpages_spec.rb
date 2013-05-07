require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the word ResumeQuery" do
      visit '/'
      page.should have_content('ResumeQuery')
    end

    it "should have the message saying happy what day it is" do
      visit '/'
      page.should have_content("Happy #{Time.now.strftime("%A")}")
    end
  end
  
  describe "Structure Page when not signed in"
    it "should say: First, get your resume in the right structure"
      visit '/structure'
      page.should have_content("First, get your resume in the right structure")
    end
  end
  
  #describe "signed in dashboard page" do
   # visit '/'
    #it "should have the dashboard active"
    #page.should have_content(" #{}")
  
  
end



