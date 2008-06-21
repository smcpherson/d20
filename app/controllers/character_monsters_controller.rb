class CharacterMonstersController < ApplicationController
  active_scaffold do |config|
    config.actions.exclude :update # Exclude  actions from the main list view.
    config.list.per_page = 100
    list.label = "Monsters"
    list.columns    = [:name, :initiative, :hp, :attack, :ac, :challenge ]   # Visable columns in "list" view.  
    config.columns << [:name, :initiative, :hp, :attack, :ac, :challenge ]   # Add virtual columns to activescaffold object
    config.columns[:name].includes = [:monster]
    config.columns[:hp].includes = [:monster]
    config.columns[:attack].includes = [:monster]
    config.columns[:challenge].includes = [:monster]
    config.columns[:ac].includes = [:monster]
    config.columns[:initiative].includes = [:monster]
    config.columns[:name].sort_by :sql => "name"
    config.columns[:hp].sort_by :sql => "hit_dice"
    config.columns[:attack].sort_by :sql => "base_attack"
    config.columns[:challenge].sort_by :sql => "challenge_rating"
    config.columns[:ac].sort_by :sql => "armor_class"
    config.columns[:initiative].sort_by :sql => "initiative"
  end
end
