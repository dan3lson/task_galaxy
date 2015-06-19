require "sinatra/activerecord"
require "shoulda-matchers"
require_relative "../../app/models/task.rb"
require_relative "../../app/models/project.rb"
require_relative "../../app/models/user.rb"
require_relative "../../app/models/team.rb"

RSpec.describe Team do

  describe "#initialization" do
    it { should belong_to(:task) }
    it { should belong_to(:user) }
    it { should belong_to(:project) }
  end
end
