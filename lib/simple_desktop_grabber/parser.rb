require 'fileutils'
require 'open-uri'
require 'uri'

require 'nokogiri'

module SimpleDesktopGrabber
  class Parser
    attr_accessor :url_base

    STATIC_HOST = "http://static.simpledesktops.com/desktops/"

    def initialize(url_base)
      self.url_base = url_base
    end

    def download
      path = File.expand_path("~/Pictures/desktops/simple_desktop")
      FileUtils.mkdir_p(path)
      images.each do |image|
        filepath = File.join(path,image.split("/").last)
        `wget -O  #{filepath} "#{image}"`
      end
    end

    def images
      @images ||= set_image_links
    end

    def pages
      @pages ||= set_pagination_links
    end

    private
    def page_link(page)
      uri = URI.join(url_base,"browse/#{page}/")
      uri.to_s
    end

    def set_image_links
      image_links = []

      pages.each do |page|
        content = Nokogiri::HTML(open(page))
        links = content.css('div.desktop a').collect{ |a| a['href'] }
        image_links << links.select { |link| link.include?(STATIC_HOST) }
      end

      image_links.flatten!
    end

    def set_pagination_links
      pagination_links = []
      pagination_links << url_base
      pagination_links << (2..27).collect { |p| page_link(p.to_s) }
      pagination_links.flatten!
    end
  end
end
