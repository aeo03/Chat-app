require 'rails_helper'

RSpec.describe User do 

    before(:each) do
        @user = User.create!(email: "email@yahoo.com", password: "8zYn%$Ezrjrx")
    end

    context 'creation tests' do
        it "should have one item created after being created" do
            expect(User.all.count).to eq(1)
        end
    end
    
    context 'validation tests' do
        it "should not let a user be created without an email address" do
            @user.email = nil
            expect(@user).to_not be_valid
        end

        it "should not let a user be created when the password length is less than 6" do
            @user.password = 'pass'
            expect(@user).to_not be_valid
        end

        it "should not let a user be created when the password length is more than 128" do
            @user.password = 'a' * 129
            expect(@user).to_not be_valid
        end

    end
    
end
