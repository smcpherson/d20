class CharactersController < ApplicationController
  layout "standard"

  # Active Scaffold config for this controller:
  active_scaffold do |config|
    config.actions.exclude :show # :delete,  # Exclude actions from the main list view.
    config.list.columns << :total_money
    config.update.link.page = true    
    label = "Characters"
    list.columns = [:character_name, :player_name, :race, :class_type, :hp, :hp_max, :ac_total, :xp, :money_total]   # Visable columns in "list" view.
    list.sorting = {:character_name => 'ASC'}
    config.columns << :ac_total # Add virtual field to the main columns object
    columns[:ac_total].label = 'AC'
    columns[:hp].label = 'HP'
    columns[:xp].label = 'XP'
    columns[:character_name].label = "Character"  # Override existing column name.
    columns[:player_name].label = "Player"  # Override existing column name.
    config.create.columns.add_subgroup "Attributes" do |name_group|
      name_group.add :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
    end
  end

  # Inline Editing Functions:
  def update_character_inline
      value = params[:value]
      id = params[:id]
      field = params[:field]
      @character = Character.find(id)
      orig =  @character.attributes
      oldValue = orig[field]
      @character.update_attribute(field, value)
      @character.save
      description = "`"+field+"` changed from "+oldValue.to_s+" to "+value
      Event.log(id, description)
      render :layout => false, :inline => value
  end


  # Drag & Drop Functions:
  def add_item
    @character_id  = params[:character_id]
    @item_id       = params[:id].split("-")[2]
    @character     = Character.find(@character_id)
    @item          = Item.find(@item_id)
    @characterItem = CharacterItem.new
    @characterItem.character_id = @character_id
    @characterItem.item_id = @item_id
    @characterItem.save 
    @test = @characterItem.methods.sort.to_yaml
    render :nothing => true
    # render :partial => 'add_items'
    # render :layout => false, :inline => @test
  end


  def add_monster
      @character_id  = params[:character_id]
      @monster_id    = params[:id].split("-")[2]
      @character     = Character.find(@character_id)
      @monster       = Monster.find(@monster_id)
      @characterMonster = CharacterMonster.new
      @characterMonster.character_id = @character_id
      @characterMonster.monster_id = @monster_id
      @characterMonster.save
      @test = @characterMonster.methods.sort.to_yaml
      render :nothing => true
      # render :partial => 'add_items'
      # render :layout => false, :inline => @test
  end



  # ?? Not used yet...
  def player_view
    @record = Character.find(params[:id])
  end

end