require 'rails_helper'


describe User do
  subject(:user) do
    FactoryGirl.build(
      :user,
      email: "jonathan@fakesite.com",
      password: "good_password"
    )
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }


  #test #is_password?
  it "expects #is_password to create a password digest" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  #test #reset_session_token
  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("good_password")).to be true
    end

    it "verifies a passoword is not correct" do
      expect(user.is_password?("forgot_your_damn_password")).to be false
    end
  end
  #test ::find_by_credentials

  describe ".find_by_credentials" do
    before {user.save!}

    it "expects ::find_by_credentials to return a user" do
      expect(User.find_by_credentials(email:"jonathan@fakesite.com", password: "good_password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials(email"bobo", password: "dodo")).to eq(nil)
    end
  end
end
