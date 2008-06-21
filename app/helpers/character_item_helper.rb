module CharacterItemHelper

  # COLUMN tweaks:
  def equipped_column(record)
    "<a href='#' onclick='return false;' id='record_equipped_#{record.id}'>#{record.equipped}</a>
    <script type='text/javascript'>
      new Ajax.InPlaceSelect('record_equipped_#{record.id}', '/character_item/update_equipped_inline', [1, 0], ['true', 'false'], {callback: function(form, value) { return 'id=#{record.id}&field=equipped&value=' + escape(value) }});
    </script>"
  end


end
