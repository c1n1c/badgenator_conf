# -*- coding: utf-8 -*-

class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name, :null => false
      t.string :surname
      t.string :company
      t.string :profession

      t.references :badge_set, :foreign_key => {:dependent => :delete}

      t.timestamps
    end

    add_index :badges, :badge_set_id
  end
end
