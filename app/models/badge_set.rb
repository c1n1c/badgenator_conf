# coding: utf-8
class BadgeSet < ActiveRecord::Base
  attr_accessible :name, :image, :source, :badges_attributes

  has_many :badges, :dependent => :destroy

  accepts_nested_attributes_for :badges

  validates :name, :presence => true, :length => {:in => 2..50}
  validates :source, :presence => true, :unless => :name?


  mount_uploader :image, ImageUploader
  mount_uploader :source, SourceUploader


  before_validation :assign_name, :on => :create
  before_create :assign_badges_attributes

  private
  def assign_name
    self.name = File.basename(source.url, '.csv') if should_assign_name?
  end

  def assign_badges_attributes
    if source.present?
      attr_names = [:name, :surname, :company, :profession]

      self.badges_attributes = BadgeSetBulkLoader.load(source.path, attr_names)
    end
  end

  def should_assign_name?
    name.blank? && source.present?
  end
end
