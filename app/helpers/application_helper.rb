module ApplicationHelper

  SUPER_ADMIN = "SuperAdmin"
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), :class => direction, :remote => true
  end


  
  def get_all_pages
		StaticPage.footer	
  end
    
  def get_marital_status
    [["Select", ""]] + [["Never Married", "Never Married"]] + [["Married", "Married"]] + [["Widow/Widower", "Widow/Widower"]] + [["Separated but not divorced", "Separated but not divorced"]] + [["Divorced", "Divorced"]] + [["De facto", "De facto"]] + [["Unknow", "Unknow"]] 
  end
  
  def get_finageuom
    [["Select Option", ""]] + [["Year", "Year"]] + [["Month", "Month"]] + [["Weeks", "Weeks"]] + [["Days", "Days"]] + [["Hours", "Hours"]] + [["Adault", "Adault"]] + [["Child", "Child"]] + [["Unborn", "Unborn"]]
  end
  
  def get_permit_received_by
    [["Select Option", ""]] + [["Mail", "Mail"]] + [["In Person", "In Person"]] + [["Faxed", "Faxed"]] + [["Online", "Online"]]
  end  

  def letter_type_data
    [["Select Option", ""]] + [["Interment", "Interment"]] + [["Grave Care", "Grave Care"]] + [["Permit", "Permit"]]
  end  

  def super_admin_access_roles
    Role.all.collect {|r| [r.role_type, r.id]} 
  end
  
  def get_parent_category
    [["Select", ""]] + Category.parent_categories.active.collect {|r| [r.name, r.id]} 
  end  
  
  def get_permit_data
    [["Select", ""]] + @cemetery.permits.collect {|r| [r.permit_number, r.id]}
  end
  
  def get_catalog_data
    [["Select", ""]] + @cemetery.catalogs.collect {|r| [r.name, r.id]}
  end
  
  def get_delegation_department_data
    [["Select", ""]] + @cemetery.delegation_departments.collect {|r| [r.name, r.id]}
  end    
    
  def get_work_type_data
    [["Select", ""]] + @cemetery.work_types.collect {|r| [r.name, r.id]}
  end  
  
  def get_category_data
    [["Select", ["Select1", ["Select2", ""]]]]
  end
  
  def get_charge_data
    [["Select", ""]] + Charge.all.collect {|r| [r.work_type, r.id]}
  end  
  
  def get_chapel_data
    @cemetery.chapels.collect {|r| [r.name, r.id]}
  end
  
  def get_room_data
    @cemetery.rooms.collect {|r| [r.name, r.id]}
  end      
  
  def manager_access_roles
    Role.where("role_type != ?", SUPER_ADMIN).collect {|r| [r.role_type, r.id]} 
  end  
      
  def get_normal_staff 
    if @cemetery
      [["Select", ""]] + User.all_normal_staff(@cemetery.id).active.collect {|r| [r.username, r.id]}
    else
      [["Select", ""]]
    end     
  end      
      
  def get_stone_masons
    if @cemetery
      [["Select", ""]] + User.all_stone_masons(@cemetery.id).active.collect {|r| [r.username, r.id]}
    else
      [["Select", ""]]
    end     
  end

  def get_funeral_directors
    if @cemetery
      [["Select", ""]] + User.all_funeral_directors(@cemetery.id).active.collect {|r| [r.username, r.id]}
    else
      [["Select", ""]]
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
  
  def get_area_data
    [["Select", ""]] + @cemetery.areas.active.collect {|r| [r.code, r.id]}
  end
  
  def get_grantee_data
    [["Select", ""]] + @cemetery.grantees.collect {|r| [(r.surname + " " + r.first_name) , r.id]}
  end  
  
  def get_grantees_of_grave(grave)
    if grave
      [["Select", ""]] + grave.grantees.collect {|r| [(r.surname + " " + r.first_name) , r.id]}
    else
      [["Select", ""]]
    end
  end
  
  def get_bookings_of_grave(grave)
    if grave
      [["Select", ""]] + grave.bookings.collect {|r| [r.deceased_name , r.id]}
    else
      [["Select", ""]]
    end
  end
  
  def get_section_data(single)
    if single.area
      [["Select", ""]] + Section.active.where(:area_id => single.area.id).collect {|r| [r.code, r.id]}
    else
      [["Select", ""]] + @cemetery.sections.in_cemetery.active.collect {|r| [r.code, r.id]}
    end    
  end  
  
  def get_row_data(single)
    if single.section
      [["Select", ""]] + Row.active.where(:section_id => single.section.id).collect {|r| [r.name, r.id]}
    elsif single.area
      [["Select", ""]] + Row.active.where(:area_id => single.area.id).collect {|r| [r.name, r.id]}
    else
      [["Select", ""]] + @cemetery.rows.in_cemetery.active.collect {|r| [r.name, r.id]}
    end    
  end  
  
  def get_plot_data(single)
    if single.row
      [["Select", ""]] + Plot.active.where(:row_id => single.row.id).collect {|r| [r.name, r.id]}
    elsif single.section
      [["Select", ""]] + Plot.active.where(:section_id => single.section.id).collect {|r| [r.name, r.id]}
    elsif single.area
      [["Select", ""]] + Plot.active.where(:area_id => single.area.id).collect {|r| [r.name, r.id]}
    else
      [["Select", ""]] + @cemetery.plots.in_cemetery.active.collect {|r| [r.name, r.id]}
    end         
  end  
  
  def get_grave_data(single)
    if single.plot
      [["Select", ""]] + Grafe.active.where(:plot_id => single.plot.id).collect {|r| [r.grave_number, r.id]}
    elsif single.row
      [["Select", ""]] + Grafe.active.where(:row_id => single.row.id).collect {|r| [r.grave_number, r.id]}
    elsif single.section
      [["Select", ""]] + Grafe.active.where(:section_id => single.section.id).collect {|r| [r.grave_number, r.id]}
    elsif single.area
      [["Select", ""]] + Grafe.active.where(:area_id => single.area.id).collect {|r| [r.grave_number, r.id]}
    else
      [["Select", ""]] + @cemetery.graves.in_cemetery.active.collect {|r| [r.grave_number, r.id]}
    end  
  end  
  
end
