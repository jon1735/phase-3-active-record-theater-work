require "pry"
class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.pluck(:actor)
  end

  def locations
    auditions.pluck(:locations)
  end

  def lead
    actor = auditions.find_by(hired: true)
    actor ? actor : "no actor has been hired for this role"
  end

  def understudy
    actor = auditions.where(hired: true).second
    actor ? actor : "no actor has been hired for this role"
  end
end
