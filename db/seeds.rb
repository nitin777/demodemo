#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

countries_list = [{:name => 'Australia'}, {:name => ' Afghanistan'}, {:name => 'Albania'}, {:name => 'Algeria'}, {:name => 'Andorra'}, {:name => 'Angola'}, {:name => 'Antigua and Barbuda'}, {:name => 'Argentina'}, {:name => 'Armenia'}, {:name => 'Austria'}, {:name => 'Azerbaijan'}, {:name => 'Bahamas, The'}, {:name => 'Bahrain'}, {:name => 'Bangladesh'}, {:name => 'Barbados'}, {:name => 'Belarus'}, {:name => 'Belgium'}, {:name => 'Belize'}, {:name => 'Benin'}, {:name => 'Bhutan'}, {:name => 'Bolivia'}, {:name => 'Bosnia and Herzegovina'}, {:name => 'Botswana'}, {:name => 'Brazil'}, {:name => 'Brunei'}, {:name => 'Bulgaria'}, {:name => 'Burkina Faso'}, {:name => 'Burundi'}, {:name => 'Cambodia'}, {:name => 'Cameroon'}, {:name => 'Canada'}, {:name => 'Cape Verde'}, {:name => 'Central African Republic'}, {:name => 'Chad'}, {:name => 'Chile'}, {:name => 'China-Peoples Republic of'}, {:name => 'Colombia'}, {:name => 'Comoros'}, {:name => 'Congo-Kinshasa Democratic Rep'}, {:name => 'Congo-Brazzaville Republic of '}, {:name => 'Costa Rica'}, {:name => 'Cote d Ivoire-Ivory Coast'}, {:name => 'Croatia'}, {:name => 'Cuba'}, {:name => 'Cyprus'}, {:name => 'Czech Republic'}, {:name => 'Denmark'}, {:name => 'Djibouti'}, {:name => 'Dominica'}, {:name => 'Dominican Republic'}, {:name => 'Ecuador'}, {:name => 'Egypt'}, {:name => 'El Salvador'}, {:name => 'Equatorial Guinea'}, {:name => 'Eritrea'}, {:name => 'Estonia'}, {:name => 'Ethiopia'}, {:name => 'Fiji'}, {:name => 'Finland'}, {:name => 'France'}, {:name => 'Gabon'}, {:name => 'Gambia, The'}, {:name => 'Georgia'}, {:name => 'Germany'}, {:name => 'Ghana'}, {:name => 'Greece'}, {:name => 'Grenada'}, {:name => 'Guatemala'}, {:name => 'Guinea'}, {:name => 'Guinea-Bissau'}, {:name => 'Guyana'}, {:name => 'Haiti'}, {:name => 'Honduras'}, {:name => 'Hungary'}, {:name => 'Iceland'}, {:name => 'India'}, {:name => 'Indonesia'}, {:name => 'Iran'}, {:name => 'Iraq'}, {:name => 'Ireland'}, {:name => 'Israel'}, {:name => 'Italy'}, {:name => 'Jamaica'}, {:name => 'Japan'}, {:name => 'Jordan'}, {:name => 'Kazakhstan'}, {:name => 'Kenya'}, {:name => 'Kiribati'}, {:name => 'Korea-North Korea-Democratic P'}, {:name => 'Korea-South Korea-Republic of '}, {:name => 'Kuwait'}, {:name => 'Kyrgyzstan'}, {:name => 'Laos'}, {:name => 'Latvia'}, {:name => 'Lebanon'}, {:name => 'Lesotho'}, {:name => 'Liberia'}, {:name => 'Libya'}, {:name => 'Liechtenstein'}, {:name => 'Lithuania'}, {:name => 'Luxembourg'}, {:name => 'Macedonia'}, {:name => 'Madagascar'}, {:name => 'Malawi'}, {:name => 'Malaysia'}, {:name => 'Maldives'}, {:name => 'Mali'}, {:name => 'Malta'}, {:name => 'Marshall Islands'}, {:name => 'Mauritania'}, {:name => 'Mauritius'}, {:name => 'Mexico'}, {:name => 'Micronesia'}, {:name => 'Moldova'}, {:name => 'Monaco'}, {:name => 'Mongolia'}, {:name => 'Montenegro'}, {:name => 'Morocco'}, {:name => 'Mozambique'}, {:name => 'Myanmar-Burma'}, {:name => 'Namibia'}, {:name => 'Nauru'}, {:name => 'Nepal'}, {:name => 'Netherlands'}, {:name => 'New Zealand'}, {:name => 'Nicaragua'}, {:name => 'Niger'}, {:name => 'Nigeria'}, {:name => 'Norway'}, {:name => 'Oman'}, {:name => 'Pakistan'}, {:name => 'Palau'}, {:name => 'Panama'}, {:name => 'Papua New Guinea'}, {:name => 'Paraguay'}, {:name => 'Peru'}, {:name => 'Philippines'}, {:name => 'Poland'}, {:name => 'Portugal'}, {:name => 'Qatar'}, {:name => 'Romania'}, {:name => 'Russia'}, {:name => 'Rwanda'}, {:name => 'Saint Kitts and Nevis'}, {:name => 'Saint Lucia'}, {:name => 'Saint Vincent and the Grenadin'}, {:name => 'Samoa'}, {:name => 'San Marino'}, {:name => 'Sao Tome and Principe'}, {:name => 'Saudi Arabia'}, {:name => 'Senegal'}, {:name => 'Serbia'}, {:name => 'Seychelles'}, {:name => 'Sierra Leone'}, {:name => 'Singapore'}, {:name => 'Slovakia'}, {:name => 'Slovenia'}, {:name => 'Solomon Islands'}, {:name => 'Somalia'}, {:name => 'South Africa'}, {:name => 'Spain'}, {:name => 'Sri Lanka'}, {:name => 'Sudan'}, {:name => 'Suriname'}, {:name => 'Swaziland'}, {:name => 'Sweden'}, {:name => 'Switzerland'}, {:name => 'Syria'}, {:name => 'Tajikistan'}, {:name => 'Tanzania'}, {:name => 'Thailand'}, {:name => 'Timor-Leste-East Timor'}, {:name => 'Togo'}, {:name => 'Tonga'}, {:name => 'Trinidad and Tobago'}, {:name => 'Tunisia'}, {:name => 'Turkey'}, {:name => 'Turkmenistan'}, {:name => 'Tuvalu'}, {:name => 'Uganda'}, {:name => 'Ukraine'}, {:name => 'United Arab Emirates'}, {:name => 'United Kingdom'}, {:name => 'United States'}, {:name => 'Uruguay'}, {:name => 'Uzbekistan'}, {:name => 'Vanuatu'}, {:name => 'Vatican City'}, {:name => 'Venezuela'}, {:name => 'Vietnam'}, {:name => 'Yemen'}, {:name => 'Zambia'}, {:name => 'Zimbabwe'}, {:name => 'Abkhazia'}, {:name => 'Taiwan, Republic of China'}, {:name => 'Nagorno-Karabakh'}, {:name => 'Northern Cyprus'}, {:name => 'Pridnestrovie-Transnistria-'}, {:name => 'Somaliland'}, {:name => 'South Ossetia'}, {:name => 'Ashmore and Cartier Islands'}, {:name => 'Christmas Island'}, {:name => 'Cocos-Keeling Islands'}, {:name => 'Coral Sea Islands'}, {:name => 'Heard Island and McDonald Isla'}, {:name => 'Norfolk Island'}, {:name => 'New Caledonia'}, {:name => 'French Polynesia'}, {:name => 'Mayotte'}, {:name => 'Saint Barthelemy'}, {:name => 'Saint Martin'}, {:name => 'Saint Pierre and Miquelon'}, {:name => 'Wallis and Futuna'}, {:name => 'French Southern and Antarctic '}, {:name => 'Clipperton Island'}, {:name => 'Bouvet Island'}, {:name => 'Cook Islands'}, {:name => 'Niue'}, {:name => 'Tokelau'}, {:name => 'Guernsey'}, {:name => 'Isle of Man'}, {:name => 'Jersey'}, {:name => 'Anguilla'}, {:name => 'Bermuda'}, {:name => 'British Indian Ocean Territory'}, {:name => 'British Sovereign Base Areas'}, {:name => 'British Virgin Islands'}, {:name => 'Cayman Islands'}, {:name => 'Falkland Islands-Islas Malvina'}, {:name => 'Gibraltar'}, {:name => 'Montserrat'}, {:name => 'Pitcairn Islands'}, {:name => 'Saint Helena'}, {:name => 'South Georgia and the South Sa'}, {:name => 'Turks and Caicos Islands'}, {:name => 'Northern Mariana Islands'}, {:name => 'Puerto Rico'}, {:name => 'American Samoa'}, {:name => 'Baker Island'}, {:name => 'Guam'}, {:name => 'Howland Island'}, {:name => 'Jarvis Island'}, {:name => 'Johnston Atoll'}, {:name => 'Kingman Reef'}, {:name => 'Midway Islands'}, {:name => 'Navassa Island'}, {:name => 'Palmyra Atoll'}, {:name => 'US Virgin Islands'}, {:name => 'Wake Island'}, {:name => 'Hong Kong'}, {:name => 'Macau'}, {:name => 'Faroe Islands'}, {:name => 'Greenland'}, {:name => 'French Guiana'}, {:name => 'Guadeloupe'}, {:name => 'Martinique'}, {:name => 'Reunion'}, {:name => 'Aland'}, {:name => 'Aruba'}, {:name => 'Netherlands Antilles'}, {:name => 'Svalbard'}, {:name => 'Ascension'}, {:name => 'Tristan da Cunha'}, {:name => 'Antarctica'}, {:name => 'Kosovo'}, {:name => 'Palestinian Territories-Gaza S'}, {:name => 'Western Sahara'}, {:name => 'Australian Antarctic Territory'}, {:name => 'Ross Dependency'}, {:name => 'Peter I Island'}, {:name => 'Queen Maud Land'}, {:name => 'British Antarctic Territory'}, {:name => 'nitinc'}]
denomination_list = [{:name => 'BUDDHISM'}, {:name => 'BUDDHISM, Theravada'}, {:name => 'BUDDHISM, Hinayana'}, {:name => 'BUDDHISM, Mahayana'}, {:name => 'BUDDHISM, Tibetan'}, {:name => 'BUDDHISM, Zen'}, {:name => 'BUDDHISM, Pure Land'}, {:name => 'BUDDHISM, Nichiren Japanese'}, {:name => 'CHRISTIANITY'}, {:name => 'CHRISTIANITY, Anglican Church of Austral'}, {:name => 'CHRISTIANITY, Anglican Catholic Church'}, {:name => 'CHRISTIANITY, Baptist'}, {:name => 'CHRISTIANITY, Brethren'}, {:name => 'CHRISTIANITY, Catholic'}, {:name => 'CHRISTIANITY, Western Catholic'}, {:name => 'CHRISTIANITY, Maronite Catholic'}, {:name => 'CHRISTIANITY, Melkite Catholic'}, {:name => 'CHRISTIANITY, Ukrainian Catholic'}, {:name => 'CHRISTIANITY, Chaldean Catholic'}, {:name => 'CHRISTIANITY, Churches of Christ'}, {:name => 'CHRISTIANITY, Churches of Christ (Confer'}, {:name => 'CHRISTIANITY, Church of Christ (Nondenom'}, {:name => 'CHRISTIANITY, International Church of Ch'}, {:name => "CHRISTIANITY, Jehovah's Witnesses"}, {:name => 'CHRISTIANITY, Latter Day Saints'}, {:name => 'CHRISTIANITY, Church of Jesus Christ of '}, {:name => 'CHRISTIANITY, Community of Christ LDS'}, {:name => 'CHRISTIANITY, Lutheran'}, {:name => 'CHRISTIANITY, Orthodox - Armenian Aposto'}, {:name => 'CHRISTIANITY, Orthodox - Albanian'}, {:name => 'CHRISTIANITY, Orthodox - Antiochian'}, {:name => 'CHRISTIANITY, Orthodox - Coptic Church'}, {:name => 'CHRISTIANITY, Orthodox - Ethiopian Churc'}, {:name => 'CHRISTIANITY, Orthodox - Greek'}, {:name => 'CHRISTIANITY, Orthodox - Macedonian'}, {:name => 'CHRISTIANITY, Orthodox - Romanian'}, {:name => 'CHRISTIANITY, Orthodox - Russian'}, {:name => 'CHRISTIANITY, Orthodox - Eastern'}, {:name => 'CHRISTIANITY, Orthodox - Serbian '}, {:name => 'CHRISTIANITY, Orthodox - Syrian Church'}, {:name => 'CHRISTIANITY, Orthodox - Ukrainian '}, {:name => 'CHRISTIANITY, Orthodox - Oriental '}, {:name => 'CHRISTIANITY, Assyrian Apostolic'}, {:name => 'CHRISTIANITY, Assyrian Church of the Eas'}, {:name => 'CHRISTIANITY, Ancient Church of the East'}, {:name => 'CHRISTIANITY, Presbyterian'}, {:name => 'CHRISTIANITY, Reformed'}, {:name => 'CHRISTIANITY, Free Reformed'}, {:name => 'CHRISTIANITY, Salvation Army'}, {:name => 'CHRISTIANITY, Seventh-day Adventist'}, {:name => 'CHRISTIANITY, Uniting Church'}, {:name => 'CHRISTIANITY, Pentecostal'}, {:name => 'CHRISTIANITY, Pent - Apostolic Church (A'}, {:name => 'CHRISTIANITY, Pent - Assemblies of God'}, {:name => 'CHRISTIANITY, Pent - Bethesda Churches'}, {:name => 'CHRISTIANITY, Pent - Christian City Chur'}, {:name => 'CHRISTIANITY, Pent - Christian Life Chur'}, {:name => 'CHRISTIANITY, Pent - Christian Outreach '}, {:name => 'CHRISTIANITY, Pent - Christian Revival C'}, {:name => 'CHRISTIANITY, Pent - Faith Churches'}, {:name => 'CHRISTIANITY, Pent - Foursquare Gospel C'}, {:name => 'CHRISTIANITY, Pent - Full Gospel Church'}, {:name => 'CHRISTIANITY, Pent - Revival Centres'}, {:name => 'CHRISTIANITY, Pent - Rhema Family Church'}, {:name => 'CHRISTIANITY, Pent - United Pentecostal'}, {:name => 'CHRISTIANITY, Protestant'}, {:name => 'CHRISTIANITY, Aboriginal Evangelical Mi'}, {:name => 'CHRISTIANITY, Born Again Christian '}, {:name => 'CHRISTIANITY, Christian and Missionary '}, {:name => 'CHRISTIANITY, Church of the Nazarene '}, {:name => 'CHRISTIANITY, Congregational'}, {:name => 'CHRISTIANITY, Ethnic Evangelical Church'}, {:name => 'CHRISTIANITY, Independent Evangelical C'}, {:name => 'CHRISTIANITY, Wesleyan Methodist Church'}, {:name => 'CHRISTIANITY, Apostolic Church of Queens'}, {:name => 'CHRISTIANITY, Christadelphians'}, {:name => 'CHRISTIANITY, Christian Science'}, {:name => 'CHRISTIANITY, Gnostic Christians'}, {:name => 'CHRISTIANITY, Liberal Catholic Church'}, {:name => 'CHRISTIANITY, New Apostolic Church'}, {:name => 'CHRISTIANITY, New Churches (Swedenborgia'}, {:name => 'CHRISTIANITY, Ratana (Maori)'}, {:name => 'CHRISTIANITY, Religious Science'}, {:name => 'CHRISTIANITY, Religious Society of Frien'}, {:name => 'CHRISTIANITY, Temple Society'}, {:name => 'CHRISTIANITY, Unitarian'}, {:name => 'CHRISTIANITY, Worldwide Church of God'}, {:name => 'HINDUISM'}, {:name => 'HINDUISM, Vaishnavas'}, {:name => 'HINDUISM, Saivas '}, {:name => 'HINDUISM, Saktas '}, {:name => 'HINDUISM, Sauras'}, {:name => 'HINDUISM, Ganapatyas '}, {:name => 'HINDUISM, Kumaras '}, {:name => 'ISLAM, Sunni'}, {:name => 'ISLAM'}, {:name => "ISLAM, Shi'a"}, {:name => 'ISLAM, Sufi'}, {:name => 'ISLAM, Ahmaddiya'}, {:name => 'JUDAISM'}, {:name => 'JUDAISM, Orthodox'}, {:name => 'JUDAISM, Orthodox - Hasidim'}, {:name => 'JUDAISM, Orthodox - Haredim'}, {:name => 'JUDAISM, Progressive'}, {:name => 'JUDAISM, Progressive - Reform Judaism'}, {:name => 'JUDAISM, Progressive - Liberal Judaism'}]


puts 'load super admin'
@admin = User.new(:username => 'bruntech', :first_name => 'bruntech', :password => '1c3m3t3ry2', :password_confirmation => '1c3m3t3ry2', :last_name => 'bruntech', :email => 'walter@bruntech.com.au', :is_active => 1)
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

puts 'load language'
Language.create([{:name => 'English', :code => 'en'}, {:name => 'Français', :code => 'fr'}, {:name => 'Español', :code => 'es'}, {:name => 'Português', :code => 'pr'}])

puts 'load service types'
ServiceType.create([{:name => "Interment"}, {:name => "Exhumation"}, {:name => "Ashes"}])

puts 'load payment statuses'
PaymentStatus.create([{:name => "Credit"}, {:name => "Pending"}])

puts 'load coffin'
Coffin.create([{:name => "Shaped Coffin"}, {:name => "Rectangle Coffin"}, {:name => "Ashes Urn 240 cubic inches"}, {:name => "Ashes Urn 200 cubic inches"}, {:name => "Ashes Urn 150 cubic inches"}, {:name => "Ashes Urn 100 cubic inches"}, {:name => "Ashes Urn 50 cubic inches"}, {:name => "Ashes Urn 25 cubic inches"}, {:name => "Ashes Urn 10 cubic inches"}, {:name => "American Casket"}, {:name => "Ashes"}, {:name => "Tapered Coffin"}])

puts 'load countries'
Country.create(countries_list)

puts 'load diseases'
Disease.create([{:name => 'Creutzfeldt-Jakob disease & Varient'}, {:name => 'Hepatitis C'}, {:name => 'Human immunodeficiency virus infection (HIV)'}, {:name => 'Diphtheria'}, {:name => 'Plague '}, {:name => 'Respiratory anthrax'}, {:name => 'Smallpox'}, {:name => 'Tuberculosis'}, {:name => 'Viral haemorrhagic fever'}, {:name => 'Lassa'}, {:name => 'Marburg'}, {:name => 'Ebola'}, {:name => 'Crimean-Congo fever'}, {:name => 'None Applicable'}, {:name => 'Avian influenza in humans'}, {:name => 'Severe Acute Respiratory Syndrome'}, {:name => 'Sepsis'}])

puts 'load denominations'
Denomination.create(denomination_list)

puts 'load grave_statuses'
GraveStatus.create([{:name => 'Vacant'}, {:name => 'Pre-Purchased'}, {:name => 'In Use'}, {:name => 'To Be Investigated'}, {:name => 'Tree'}, {:name => 'Reserved'}, {:name => 'On Hold'}, {:name => 'Allocated'}, {:name => 'Obstruction'}])

puts 'load identities'
Identity.create([{:name => 'Medicare Card'}, {:name => 'Bank Account'}, {:name => 'Utility Bill'}, {:name => 'Driving Licence'}, {:name => 'Passport'}, {:name => 'Pension Card'}, {:name => 'Transport Consession Card'}, {:name => 'Burial Application'}, {:name => 'Proof of Age Card'}, {:name => 'N/A'}])

puts 'load unit_types'
UnitType.create([{:name => 'Millimetres'}, {:name => 'Centimetres'}, {:name => 'Metres'}, {:name => 'Inches'}, {:name => 'Feet'}, {:name => 'Yard'}, ])

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