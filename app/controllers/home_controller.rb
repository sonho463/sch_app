class HomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  
  def top
    url = 'http://agora.ex.nii.ac.jp/cps/weather/warning/'

    # タイトルが「大阪府」の情報を取得する
    # .title.inner_text == "島根県"
    # //img[contains(@class, 'image')]
    doc = Nokogiri::HTML(open(url))
    "User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36")
    # doc.xpat(//html/body/div[2]/div[1]).each do |title|
    @title = doc.xpath(//body/div[2]/div[1])
      

  end
end
