# coding: utf-8

class Badge < ActiveRecord::Base
  attr_accessible :name, :surname, :company, :profession
  attr_readonly :badge_set

  belongs_to :badge_set

  validates :name, :presence => true, :length => {:in => 2..30}
  validates :surname, :length => {:in => 2..30}, :allow_blank => true
  validates :company, :presence => true, :length => {:in => 3..30}
  validates :profession, :length => {:in => 3..30}, :allow_blank => true

  validates :badge_set, :existence => true
end
