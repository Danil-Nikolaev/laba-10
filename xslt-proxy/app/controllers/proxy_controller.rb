require 'nokogiri'
require 'open-uri'

class ProxyController < ApplicationController
  def input; end

  def output
    my_url = URL + "&v1=#{params[:v1]}&v2=#{params[:v2]}"
    @side = params[:side]
    api_response = URI.open(my_url)
    if @side == 'server'
      @result = xslt_transform(api_response).to_html
    elsif @side == 'client-with-xslt'
      render xml: insert_browser_xslt(api_response).to_xml
    else
      render xml: api_response
    end
  end

  URL = 'http://localhost:3000/?format=xml'.freeze
  SERV_TRANS = "#{Rails.root}/public/server_transform.xslt".freeze
  BROWS_TRANS = "/browser_transform.xslt".freeze

  def xslt_transform(data, transform: SERV_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: BROWS_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet', 'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
