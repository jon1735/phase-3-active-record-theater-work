require "pry"
class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.map do |audition|
      audition.actor
    end
  end

  def locations
    auditions.map do |audition|
      audition.location
    end
  end
end
