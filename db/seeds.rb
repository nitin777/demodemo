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