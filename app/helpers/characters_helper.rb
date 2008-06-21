module CharactersHelper

  # COLUMN tweaks:
  def xp_column(record)
    "#{text_field 'record', 'xp', {:id => 'record_xp_'+record.id.to_s, :class =>"record_xp_column", :value => record.xp}}
    <script type='text/javascript'> 
      new Ajax.InPlaceEditor('record_xp_#{record.id}', '/characters/update_character_inline', {paramName:'xp', hiddenValue:'#{record.id}'});
    </script>"
  end

  def hp_column(record)
    "#{text_field 'record', 'hp', {:id => 'record_hp_'+record.id.to_s, :class =>"record_hp_column", :value => record.hp}}
    <script type='text/javascript'> 
      new Ajax.InPlaceEditor('record_hp_#{record.id}', '/characters/update_character_inline', {paramName:'hp', hiddenValue:'#{record.id}'});
    </script>"
  end

  def hp_max_column(record)
    "#{text_field 'record', 'hp_max', {:id => 'record_hp_max_'+record.id.to_s, :class =>"record_hp_max_column", :value => record.hp_max}}
    <script type='text/javascript'> 
      new Ajax.InPlaceEditor('record_hp_max_#{record.id}', '/characters/update_character_inline', {paramName:'hp_max', hiddenValue:'#{record.id}'});
    </script>"
  end

end
