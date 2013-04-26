# coding: utf-8
require 'csv'

module BadgeSetBulkLoader
  def self.load(source_path, attr_names)
    badges_attributes = []

    CSV.foreach(source_path, :col_sep => "\t") do |row|
      badges_attributes << Hash[*attr_names.zip(row).flatten!]
    end

    return badges_attributes.reverse!
  end
end
