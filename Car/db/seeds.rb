# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'nokogiri'
require 'russian'

  # fill the 'regions' and the 'towns' tables from wikipedia 'Russian cities list' article
  Region.delete_all
  Town.delete_all
  page = Nokogiri::HTML(open('https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%B2_%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D0%B8'))
  trs = page.css('table tr')
  (2..1114).each do |tr_num|
    current_tr = trs[tr_num]
    town_name = current_tr.css('td')[2].text.gsub('Оспаривается','')
    region_name = current_tr.css('td')[3].text
    region = Region.find_by_name region_name
    region ||= Region.create name: region_name
    Town.create name: town_name, region_id: region.id
    Town.create name: town_name.gsub('ё', 'е'), region_id: region  if town_name.include? 'ё'
  end


  # fill the 'car_brands' and 'models' tables from 'auto.drom.ru' page
  CarBrand.delete_all
  CarModel.delete_all
  

  #  adjust the 'car_brands' and 'models' tables in accordance with the names on 'avito.ru/rossiya/avtomobili' page

  CarModel.find_by_name('3-Series').try(:update_attributes,{synonym: '3 серия'})
  CarModel.find_by_name('5-Series').try(:update_attributes,{synonym: '5 серия'})
  CarModel.find_by_name('7-Series').try(:update_attributes,{synonym: '7 серия'})
  CarModel.delete(CarModel.find_by_name 'Civic Ferio')
  CarModel.find_by_name('Civic').try(:update_attributes,{synonym: 'Civic Ferio'})
  CarModel.find_by_name('Grand Starex').try(:update_attributes,{synonym: 'H-1 (Grand Starex)'})
  CarModel.find_by_name('GS300').try(:update_attributes,{name: 'GS', synonym: 'GS300'})
  CarModel.find_by_name('LX470').try(:update_attributes,{name: 'LX'})
  CarModel.delete(CarModel.find_by_name 'LX570')
  CarModel.find_by_name('RX300').try(:update_attributes,{name: 'RX'})
  CarModel.delete(CarModel.find_by_name 'RX330')
  CarModel.delete(CarModel.find_by_name 'RX350')
  CarModel.find_by_name('Mazda3').try(:update_attributes,{synonym: '3'})
  CarModel.find_by_name('Mazda6').try(:update_attributes,{synonym: '6'})
  CarModel.find_by_name('C-Class').try(:update_attributes,{synonym: 'C-класс'})
  CarModel.find_by_name('E-Class').try(:update_attributes,{synonym: 'E-класс'})
  CarModel.find_by_name('G-Class').try(:update_attributes,{synonym: 'G-класс'})
  CarModel.find_by_name('GL-Class').try(:update_attributes,{synonym: 'GL-класс'})
  CarModel.find_by_name('M-Class').try(:update_attributes,{synonym: 'M-класс'})
  CarModel.find_by_name('S-Class').try(:update_attributes,{synonym: 'S-класс'})
  CarModel.delete(CarModel.find_by_name 'Lancer Cedia')
  CarModel.find_by_name('Lancer').try(:update_attributes,{synonym: 'Lancer Cedia'})
  CarModel.delete(CarModel.find_by_name 'Legacy B4')
  CarModel.find_by_name('Legacy').try(:update_attributes,{synonym: 'Legacy B4'})
  CarModel.delete(CarModel.find_by_name 'Corolla Fielder')
  CarModel.find_by_name('Corolla').try(:update_attributes,{synonym: 'Corolla Fielder'})
  CarModel.find_by_name('Буханка').try(:update_attributes,{synonym: '452 Буханка'})
  CarModel.find_by_name('Патриот').try(:update_attributes,{synonym: 'Patriot'})
  CarModel.find_by_name('Хантер').try(:update_attributes,{synonym: 'Hunter'})
  CarModel.find_by_name('Tiggo').try(:update_attributes,{synonym: 'Tiggo (T11)'})
  CarModel.find_by_name('2114').try(:update_attributes,{synonym: '2114 Samara'})
  CarModel.find_by_name('2115').try(:update_attributes,{synonym: '2115 Samara'})
  CarModel.find_by_name('4x4 2121 Нива').try(:update_attributes,{synonym: '4x4 (Нива)'})
  CarModel.find_by_name('Веста').try(:update_attributes,{synonym: 'Vesta'})
  CarModel.find_by_name('Гранта').try(:update_attributes,{synonym: 'Granta'})
  CarModel.find_by_name('Калина').try(:update_attributes,{synonym: 'Kalina'})
 	CarModel.find_by_name('Приора').try(:update_attributes,{synonym: 'Priora '})