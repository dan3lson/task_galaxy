require "sinatra"
require "sinatra/activerecord"

class User < ActiveRecord::Base
  has_many :teams
  has_many :tasks, through: :teams
  has_many :projects, through: :teams

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password
  validates_uniqueness_of :password
end
