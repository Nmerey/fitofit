require 'rails_helper'

RSpec.describe User, type: :model do
  

  it "is not valid without email" do
  	user = User.new
  	expect(user).to_not be_valid
  end

  it "is not valid without password" do
  	user = User.new 
  	expect(user).to_not be_valid

  end

  it "email should be uniq" do

  	user = User.new(email: "test@mail.ru", password_digest: "Secret123")
  	user2 = User.new(email: "test@mail.ru", password_digest: "Secret123")

  	expect(user2).to_not be_valid
  	
  end

  it "email should be proper" do
  	
  end

  it "password should be proper" do
  	
  end
  


end
