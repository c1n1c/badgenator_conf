# -*- coding: utf-8 -*-

SimpleNavigation::Configuration.run do |navigation|

  navigation.selected_class = 'active'

  navigation.items do |primary|
    primary.item :home, t(:home, :scope => 'masthead.navigation'), root_path
    primary.item :archive, t(:archive, :scope => 'masthead.navigation'), badge_sets_path, :highlights_on => /archive/
    primary.item :contacts, t(:contacts, :scope => 'masthead.navigation'), contacts_path

    primary.dom_class = "nav nav-pills pull-right"

  end

end
