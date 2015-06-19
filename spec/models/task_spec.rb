require "sinatra/activerecord"
require "shoulda-matchers"
require_relative "../../app/models/task.rb"
require_relative "../../app/models/project.rb"
require_relative "../../app/models/user.rb"
require_relative "../../app/models/team.rb"

RSpec.describe Task do

  let(:name) { "Complete Task Galaxy System Check" }
  let(:description) { "Earn an \'Exceeds Expectation\' grade." }
  let(:due_date) { "June 18, 2015" }
  let(:task) { Task.create(
    name: name,
    description: description,
    due_date: due_date
    )
  }

  describe "#initialization" do
    it { should have_many(:teams) }
    it { should have_many(:users) }
    it { should have_many(:projects) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    context "task name:" do
      describe "task has a name" do
        it "returns a string" do
          expect(task.name).to eq("Complete Task Galaxy System Check")
        end
      end
      describe "task does not have a name" do
        let(:name) { nil }
        it "returns nil" do
          expect(task.name).to eq(nil)
        end
      end
    end

    context "task description:" do
      describe "task has a description" do
        it "returns a string" do
          expect(task.description).to eq("Earn an \'Exceeds Expectation\' grade.")
        end
      end
      describe "task does not have a description" do
        let(:description) { nil }
        it "returns nil" do
          expect(task.description).to eq(nil)
        end
      end
    end

    context "task has all required info" do
      it "returns an name string" do
        expect(task.name).to eq("Complete Task Galaxy System Check")
      end
      it "returns a password string" do
        expect(task.description).to eq("Earn an \'Exceeds Expectation\' grade.")
      end
    end

    context "task does not have required info" do
      let(:name) { nil }
      it "returns a nil email string" do
        expect(task.name).to eq(nil)
      end
      let(:description) { nil }
      it "returns a password string" do
        expect(task.description).to eq(nil)
      end
    end

    context "task due date:" do
      describe "task has a due date" do
        it "returns a string" do
          expect(task.due_date).to eq("June 18, 2015".to_date)
        end
      end
      describe "task does not have a due date" do
        let(:due_date) { nil }
        it "returns nil" do
          expect(task.due_date).to eq(nil)
        end
      end
    end
  end

end
