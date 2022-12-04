#frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# convert controller
class ConvertController < ApplicationController
  before_action :require_params, only: :show

  def input; end

  def show
    # api_response = open(@url) *
    api_response = URI.open("http://localhost:3000/?input_number=#{@number}&format=xml")
    case @side
    # Если делать XML -> HTML на сервере.
    when 'server' then @result = xslt_transform(api_response).to_html
    # Если делать XML -> HTML в браузере.
    when 'client-with-xslt' then render xml: insert_browser_xslt(api_response).to_xml
    # Если вообще ничего не делать.
    else render xml: api_response
    end
  end

  private

  def require_params
    @number = params[:input_number]
    @side = params[:side]
  end

  # Преобразование XSLT на сервере (код Самарева).
  def xslt_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read("#{Rails.root}/public/server_transform.xslt"))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    'type="text/xsl" href="/browser_transform.xslt"')
    doc.root.add_previous_sibling(xslt)
    # Возвращаем doc, так как предыдущая операция возвращает не XML-документ.
    doc
  end
end
