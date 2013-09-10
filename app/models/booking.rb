class Booking < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :user
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot
  belongs_to :grafe
  belongs_to :grantee
  belongs_to :service_type
  belongs_to :disease
  belongs_to :monument
  belongs_to :coffin
  belongs_to :unit_type
  belongs_to :catalog
  belongs_to :payment_status
  belongs_to :funeral_director, class_name: 'User', foreign_key: "funeral_director_id"
  belongs_to :deceased_country, class_name: 'Country', foreign_key: "deceased_country_id"
    
  has_one :booking_checklist, :dependent => :destroy
  has_many :permits
  accepts_nested_attributes_for :booking_checklist
  
  #include SearchHandler
  
  validates :deceased_surname, :presence => true
  validates :deceased_first_name, :presence => true
  
  scope :finalize, -> {where(:is_finalized => true)}
  scope :unfinalize, -> {where(:is_finalized => false)}
  
  def deceased_name(shorten=true)
    unless deceased_first_name.nil? && deceased_surname.nil? or deceased_first_name.empty? && deceased_surname.empty?
      [deceased_title, deceased_surname, deceased_first_name].join(" ")
    end
  end  
  
  scope :chapels, -> {where("chapel_id IS NOT NULL")}
  scope :rooms, -> {where("room_id IS NOT NULL")}

  def self.search(search)
    if search
      search_keys = ''
      search_fields = ['deceased_surname', 'deceased_first_name', 'deceased_middle_name']
      search.each do |k, v|
        unless v.blank?
          if search_fields.include? k
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
      all
    end
  end
  
  def self.search_booking(search)
    unless search.blank?
      where('bookings.deceased_surname LIKE ? OR bookings.deceased_first_name LIKE ? OR bookings.deceased_middle_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where("bookings.id < 1")
    end
  end   
    
end
