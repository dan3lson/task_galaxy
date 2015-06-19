require "sinatra"
require "sinatra/activerecord"

class Project < ActiveRecord::Base
  has_many :teams
  has_many :tasks, through: :teams
  has_many :users, through: :teams

  validates_presence_of :name
  validates_uniqueness_of :name
end
