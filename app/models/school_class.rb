class SchoolClass < ActiveRecord::Base
  validates_presence_of :name, :shift
  validates_uniqueness_of :name, scope: :shift

  enum shift: [
    :morning,
    :afternoon,
    :night
  ]

  belongs_to :school_unity
end
