class SchoolUnity < ActiveRecord::Base
  validates_presence_of :name, :address
  validates_uniqueness_of :name

  belongs_to :school
  has_many :school_classes
end
