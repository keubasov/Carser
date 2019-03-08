# encoding: utf-8
require 'open-uri'
require 'russian'
require 'htmlentities'
require 'json'

brands = Hash.new
open('https://auto.drom.ru/'){|f|
 	f.each_line{|line|
 		line.scan(/data-drom-module-data="([^"]+)"/)do|str|
 			if str[0].include?('models')
 				coder = HTMLEntities.new
				brands = coder.decode(str[0]).scan(/"regular":(\[{.+?\])/)[0]
			end
 		end
 	}
}
brands = JSON.parse(brands[0])
brands.delete_if{|brand| brand["quantity"]<2000}
p brands






