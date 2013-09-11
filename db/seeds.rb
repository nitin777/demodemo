#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'load super admin'
@admin = User.new(:username => 'admin', :first_name => 'admin', :password => 'admin', :password_confirmation => 'admin', :last_name => 'admin', :email => 'admin@economyofone.com', :is_active => 1)
@admin.save(:validate => false)


puts 'load user roles'
@admin_role = Role.create(:role_type => "SuperAdmin")
@admin.role = @admin_role
Role.create(:role_type => "Manager")
Role.create(:role_type => "Staff")
Role.create(:role_type => "AdminStaff")
Role.create(:role_type => "FuneralDirector")
Role.create(:role_type => "StoneMason")
Role.create(:role_type => "NormalStaff")

puts 'load counties'

Country.create(:name => "Australia")
Country.create(:name => "India")

puts 'letter variables'

LetterVariable.create(:content => "<h4 style='text-align:center;'> LETTER </h4>

<p> <h6>INFORMAT/APPLICATN</h6>
informant_title, informant_surname, informant_first_name, informant_middle_name, informant_address, informant_suburb, informant_state, informant_postal_code, relationship_to_deceased, grantee_relationship<br /><br />

<h6> DECEASED </h6>
deceased_title, deceased_surname, deceased_first_name, deceased_middle_name, deceased_address, deceased_suburb, deceased_state, deceased_postal_code, deceased_date_death, deceased_age, deceased_gender<br /><br />

<h6> ENTITY </h6>
entity_title, entity_surname, entity_first_name, entity_address, entity_suburb, entity_state<br /><br />

<h6> GENERAL </h6>
interment_date, service_date, staff_name, grave_number, area_name, section_code, today_date </p>", :is_certificate => false)


LetterVariable.create(:content => "<h4 style='text-align:center;'>CERTIFICATE</h4>

<h5> GRAVE TRASFER </h5>

from_entity_title, from_entity_surname, from_entity_first_name, to_entity_title, to_entity_surname, to_entity_first_name, surrender_date, receipt_number, grave_number, area_name, section_code, row_code, plot_code  <br /><br />

<h5>  RIGHT OF BURIAL  AND  BURIAL CERTICIFATE  </h5>

<p><h6> INFORMAT/APPLICATN </h6>
informant_title, informant_surname, informant_first_name, informant_middle_name, informant_address, informant_suburb, informant_state, relationship_to_deceased, grantee_relationship<br /><br />

<h6> DECEASED </h6>
deceased_title, deceased_surname, deceased_first_name, deceased_middle_name, deceased_address, deceased_suburb, deceased_state, deceased_date_death, deceased_age, deceased_gender<br /><br />

<h6> ENTITY </h6>
entity_title, entity_surname, entity_first_name, entity_address, entity_suburb, entity_state<br /><br />

<h6> GENERAL </h6>
interment_date, service_date, staff_name, grave_number, area_name, section_code, today_date 
</p>", :is_certificate => true)

puts 'load static pages'
faq = StaticPage.create(:name => 'FAQ', 
												:page_route => 'faq', 
												:content => "FAQ The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
												:is_footer => true
												)

about_us = StaticPage.create(:name => 'About Us', 
												:page_route => 'about', 
												:content => "About Us The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
												:is_footer => true
												)