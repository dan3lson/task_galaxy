require "sinatra/activerecord"
require "shoulda-matchers"
require_relative "../../app/models/task.rb"
require_relative "../../app/models/project.rb"
require_relative "../../app/models/user.rb"
require_relative "../../app/models/team.rb"

RSpec.describe Project do

  let(:name) { "Project System Check" }
  let(:description) { "Task Galaxy on June 18, 2015" }
  let(:project) { Project.create(
    name: name,
    description: description
    )
  }

  describe "#initialization" do
    it { should have_many(:teams) }
    it { should have_many(:tasks) }
    it { should have_many(:users) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    context "project name:" do
      describe "project has a name" do
        it "returns a string" do
          expect(project.name).to eq("Project System Check")
        end
      end
      describe "project does not have a name" do
        let(:name) { nil }
        it "returns nil" do
          expect(project.name).to eq(nil)
        end
      end
    end

    context "project description:" do
      describe "project has a description" do
        it "returns a string" do
          expect(project.description).to eq("Task Galaxy on June 18, 2015")
        end
      end
      describe "project does not have a description" do
        let(:description) { nil }
        it "returns nil" do
          expect(project.description).to eq(nil)
        end
      end
    end

    context "project has all required info" do
      it "returns an name string" do
        expect(project.name).to eq("Project System Check")
      end
      it "returns a password string" do
        expect(project.description).to eq("Task Galaxy on June 18, 2015")
      end
    end

    context "project does not have required info" do
      let(:name) { nil }
      it "returns a nil email string" do
        expect(project.name).to eq(nil)
      end
      let(:description) { nil }
      it "returns a password string" do
        expect(project.description).to eq(nil)
      end
    end
  end

end
