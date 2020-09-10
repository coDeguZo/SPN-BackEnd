require "rails_helper"

# Be sure to run rake db:seed RAILS_ENV=test before running test

RSpec.describe User, :type => :model do

    it 'can create a new user' do 
        user = User.create(name: "New User", email: "newuser@gmail.com", image: "An image here", password: "12345")
        if user.valid?
          expect(user.name).to eq("New User")
        end
    end

end