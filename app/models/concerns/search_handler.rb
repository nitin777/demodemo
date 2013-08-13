module SearchHandler
  extend ActiveSupport::Concern

  included do
    
    def self.search(search)
      if search
        search_keys = '' 
        search_values = ''
        search.each do |k, v|
          unless v.blank?
            search_keys = "#{search_keys} #{k} LIKE ? OR" 
            search_values = "#{search_values} %#{v}%,"
          end  
        end
        
        search_keys.strip!
        3.times do search_keys.chop! end
              
        search_values.strip!
        1.times do search_values.chop! end
          
        #puts search_key_val_query = "'#{search_keys}',#{search_values}"
        #puts 'sssssssss'
        #search_values_arr = search_values.split(",")
        
        
        if search_keys
          where(search_keys,search_values)
        end
      else
        scoped
      end
    end
  end  
  
end