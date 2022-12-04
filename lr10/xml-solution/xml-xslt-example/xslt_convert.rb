# frozen_string_literal: true

require 'nokogiri'

doc = Nokogiri::XML(File.read('xml-solution/xml-xslt-example/xml_test.xml'))
xslt = Nokogiri::XSLT(File.read('xml-solution/xml-xslt-example/transformer.xslt'))
puts xslt.transform(doc)