class ItemsController < ApplicationController
  active_scaffold do |config|
    config.actions.exclude :delete, :show # Exclude actions from the main list view.
    config.actions.add :live_search
    config.list.per_page = 75
    label = "Items"
    list.columns = [:name, :category, :subcategory, :price]   # Visable columns in "list" view.
    list.sorting = {:name => 'ASC'}
  end
end
