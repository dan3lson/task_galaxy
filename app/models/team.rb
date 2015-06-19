require "sinatra"
require "sinatra/activerecord"

class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :task
end
