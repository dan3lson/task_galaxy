require "sinatra/activerecord"
require "shoulda-matchers"
require_relative "../../app/models/task.rb"
require_relative "../../app/models/project.rb"
require_relative "../../app/models/user.rb"
require_relative "../../app/models/team.rb"

RSpec.describe User do
  let(:first_name) { "Danelson" }
  let(:last_name) { "Rosa" }
  let(:email) { "gitDanelson@gmail.com" }
  let(:password) { "g!tD@n3lsonN0w" }
  let(:user) { User.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password
    )
  }

  describe "#initialization" do
    it { should have_many(:teams) }
    it { should have_many(:tasks) }
    it { should have_many(:projects) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:password) }

    context "user has a full name:" do
      describe "user has a first name" do
        it "returns a string" do
          expect(user.first_name).to eq("Danelson")
        end
      end
      describe "user has a last name" do
        it "returns a string" do
          expect(user.last_name).to eq("Rosa")
        end
      end
    end
    context "user does not have a full name:" do
      describe "user has a first name but not last name" do
        let(:last_name) { nil }
        it "returns a string and nil" do
          expect(user.first_name).to eq("Danelson")
          expect(user.last_name).to eq(nil)
        end
      end
      describe "user has a last name but not first name" do
        let(:first_name) { nil }
        it "returns a string and nil" do
          expect(user.first_name).to eq(nil)
          expect(user.last_name).to eq("Rosa")
        end
      end
    end
    context "user does not have a name:" do
      describe "user has a first name but not last name" do
        let(:first_name) { nil }
        let(:last_name) { nil }
        it "returns nil" do
          expect(user.first_name).to eq(nil)
          expect(user.last_name).to eq(nil)
        end
      end
    end
    context "user has required info" do
      it "returns an email string" do
        expect(user.email).to eq("gitDanelson@gmail.com")
      end
      it "returns a password string" do
        expect(user.password).to eq("g!tD@n3lsonN0w")
      end
    end
    context "user does not have required info" do
      let(:email) { nil }
      it "returns a nil email string" do
        expect(user.email).to eq(nil)
      end
      let(:password) { nil }
      it "returns a password string" do
        expect(user.password).to eq(nil)
      end
    end
  end
end
