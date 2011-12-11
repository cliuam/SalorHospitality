class Page < ActiveRecord::Base
  include ImageMethods
  belongs_to :vendor
  belongs_to :customer
  has_and_belongs_to_many :partials
  has_many :images, :as => :imageable
  
  scope :active, where(:active => true, :hidden => false)
  scope :existing, where('hidden=false or hidden is NULL')

  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => :all_blank
end
