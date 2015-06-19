require "sinatra"
require "sinatra/activerecord"

class Task < ActiveRecord::Base
  has_many :teams
  has_many :users, through: :teams
  # Tasks should have many projects, for example:
  # "Pull project from 'et get' command" is a task that all Launchers
  # have every day for each project (aka "challenge"). Such is
  # the design of this Task Galaxy.
  has_many :projects, through: :teams

  validates_presence_of :name
  validates_uniqueness_of :name
end
