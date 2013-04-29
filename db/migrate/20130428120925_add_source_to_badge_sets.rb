class AddSourceToBadgeSets < ActiveRecord::Migration
  def change
    add_column :badge_sets, :source, :string
  end
end
