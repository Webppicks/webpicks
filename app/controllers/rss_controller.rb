class RssController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'kconv'

  def news
    # スクレイピング先のURL
    url = 'http://news.livedoor.com/topics/rss/eco.xml'

    charset = nil
    html = open(url) do |f|
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを作成
    doc = Nokogiri::HTML.parse(html.toutf8, nil, 'UTF-8')
    # node1: {title1, url1, datetime}, node2: {}
    articles = {}
    doc.xpath('//channel/item').each do |node|
      article_title = node.css('title').inner_text
      article_url =node.css('guid').inner_text
      articles[article_title] = article_url
    end

    @articles = articles
    #binding.pry
  end

  def timeline
    require 'open-uri'
    require 'nokogiri'
    require 'kconv'

    # スクレイピング先のURL
    url = 'http://news.livedoor.com/article/detail/11370632/'

    charset = nil
    html = open(url) do |f|
    f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを作成
    doc = Nokogiri::HTML.parse(html.toutf8, nil, 'UTF-8')
    # p doc.title
    article_title =  doc.css('h1.articleTtl').inner_text
    article_body = doc.css('span[itemprop="articleBody"]').inner_html.gsub('<br>','')

    puts article_title
    puts article_body
  end
end
