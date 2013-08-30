class Grafe < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot
  belongs_to :grave_status
  belongs_to :monument
  belongs_to :unit_type
  has_many :grantee_graves, :dependent => :destroy
  has_many :grantees, :through => :grantee_graves
  has_many :bookings
  belongs_to :stone_mason, class_name: 'User'
  
  validates :grave_number, :presence => true
  
  #include SearchHandler
  
  mount_uploader :image_1, ImageUploader
  mount_uploader :image_2, ImageUploader
  
  scope :active, -> {where(:is_active => true)}
  
  scope :in_cemetery, -> {where("area_id IS NULL and section_id IS NULL and row_id IS NULL and plot_id IS NULL")}
  
  def self.search(search)
    if search
      search_keys = ''
      search.each do |k, v|
        unless v.blank?
          if k == 'grave_number'
            search_keys = "#{search_keys} #{k} LIKE '%#{v}%' AND"
          else
            search_keys = "#{search_keys} #{k} = '#{v}' AND"
          end  
        end  
      end
      
      search_keys.strip!
      3.times do search_keys.chop! end
     
      if search_keys
        where(search_keys)
      end
    else
      scoped
    end
  end  
end
