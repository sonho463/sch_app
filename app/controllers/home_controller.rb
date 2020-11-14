class HomeController < ApplicationController
  require 'mechanize'

	def top
		# 警報情報のstructつくる
		weather_info = Struct.new(
			:name,
			:alert
		)

		scrape
		@weather_info = weather_info.new
		@weather_info.name = "八尾市"
		@weather_info.alert = @alert_block.inner_text




		# 八尾市の場合
		# @weather_info = weather_info.new(
		# 	"八尾市",
		# 	["暴風警報","波浪警報","大雨警報"]
		# )
		# 暴風警報出てたら学校休みだよ！
		if @weather_info.alert.include?("暴風警報")
			@sch_info = "学校は休みです。"
		else
			@sch_info = "学校はあります。"
		end

	end

	def scrape
    # Yahoo!から
    agent_yahoo = Mechanize.new
    page_yahoo = agent_yahoo.get('https://typhoon.yahoo.co.jp/weather/jp/warn/27/27212/')

    @alert_block = page_yahoo.search('//*[@class="warnDetail_head_labels"]')


		# 気象情報サイトから
    agent_agora = Mechanize.new
    page_agora = agent_agora.get('http://agora.ex.nii.ac.jp/cps/weather/warning/')
    @elements_agora = page_agora.search('//*[@class="title"]')


	end


end
