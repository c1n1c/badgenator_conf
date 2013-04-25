# coding: utf-8

class BadgeSet < ActiveRecord::Base
  attr_accessible :name, :image, :source

  has_many :badges, :dependent => :destroy

  validates :name, :presence => true, :length => {:in => 2..50}

  mount_uploader :image, ImageUploader

end
