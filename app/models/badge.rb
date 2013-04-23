# -*- coding: utf-8 -*-

class Badge < ActiveRecord::Base
  attr_accessible :name, :surname, :company, :profession

  belongs_to :badge_set
end
