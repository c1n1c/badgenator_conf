# -*- coding: utf-8 -*-

class BadgeSet < ActiveRecord::Base
  attr_accessible :name, :image, :source
  attr_accessor :image, :source

  has_many :badges

  validates :name, :presence => true
end
