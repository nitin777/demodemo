module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def get_all_pages
		StaticPage.footer	
  end
  
  def get_stone_masons
    if @cemetery
      [["Select", ""]] + @cemetery.users.all_stone_masons.active.collect {|r| [r.username, r.id]}
    else
      [["Select", ""]] + User.all_stone_masons.active.collect {|r| [r.username, r.id]}
    end     
  end
  
  def get_cemetery_data(country)
    if country
      [["Select", ""]] + country.cemeteries.active.collect {|r| [r.name, r.id]}
    else
      [["Select", ""]]
    end     
  end
  
  def get_model_data(m, cemetery=false)
    if cemetery
      [["Select", ""]] + m.constantize.active.where(:cemetery_id => @cemetery.id).collect {|r| [r.name, r.id]}
    else
      [["Select", ""]] + m.constantize.active.collect {|r| [r.name, r.id]}
    end    
  end
  
  def get_model_data_code(m, cemetery=false)
    if cemetery
      [["Select", ""]] + m.constantize.active.where(:cemetery_id => @cemetery.id).collect {|r| [r.code, r.id]}
    else
      [["Select", ""]] + m.constantize.active.collect {|r| [r.code, r.id]}
    end    
  end  
  
end
