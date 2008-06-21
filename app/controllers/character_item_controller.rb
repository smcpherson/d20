class CharacterItemController < ApplicationController
  active_scaffold do |config|
    # config.actions.exclude :update # Exclude  actions from the main list view.
    config.list.per_page = 100
    config.actions.exclude :view, :update
    list.label = "Items"
    list.columns = [:equipped, :name, :category, :subcategory, :weight]   # Visable columns in "list" view.
    show.columns = [:equipped, :name, :category, :subcategory, :weight]   # Visable columns in "show" view
    # update.columns = [:equipped]   # Visable columns in "show" view
    config.columns << [:name, :category, :subcategory, :weight]
    config.columns[:name].includes = [:item]
    config.columns[:category].includes = [:item]
    config.columns[:subcategory].includes = [:item]
    config.columns[:weight].includes = [:item]
    config.columns[:name].sort_by :sql => "name"
    config.columns[:category].sort_by :sql => "category"
    config.columns[:subcategory].sort_by :sql => "subcategory"
    config.columns[:weight].sort_by :sql => "weight"
  end

  # Inline Editing Functions:
  def update_character_inline
      value = params[:value]
      id = params[:id]
      field = params[:field]
      @item = CharacterItem.find(id)
      orig =  @item.attributes
      oldValue = orig[field]
      @item.update_attribute(field, value)
      @item.save
      render :layout => false, :inline => value
  end

end
