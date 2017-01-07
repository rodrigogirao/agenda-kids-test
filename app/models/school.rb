class School < ActiveRecord::Base
  validates_presence_of :name, :cnpj
  validates_uniqueness_of :cnpj
end
