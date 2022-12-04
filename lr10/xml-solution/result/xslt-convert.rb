# frozen_string_literal: true

require 'nokogiri'

doc = Nokogiri::XML(File.read('xml-solution/result/result-response.xml'))
xslt = Nokogiri::XSLT(File.read('xml-solution/result/transform.xslt'))
puts xslt.transform(doc)