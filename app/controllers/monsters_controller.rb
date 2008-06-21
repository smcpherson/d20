class MonstersController < ApplicationController
    active_scaffold do |config|
    config.actions.exclude :delete, :show # Exclude actions from the main list view.
    config.actions.exclude :search
    config.actions.add :live_search
    config.list.per_page = 75
    label = "Monsters"
    list.columns = [:name]   # Visable columns in "list" view.
    list.sorting = {:name => 'ASC'}
  end
end
