require "open-uri"
require "nokogiri"
require 'pry'

class Scraper
   
    CLASSES_URL = "https://www.nuffieldhealth.com/gyms/classes?gaCampaign=gyms_tiles"
    GYM_URL = "https://www.nuffieldhealth.com/"

    def self.scrape_gym
        html = open(CLASSES_URL)
        doc = Nokogiri::HTML(html)
       
        doc.css(".card-group").css(".grid__cell").each do |class_element|
        title = class_element.css(".card__heading").text.strip.gsub(/[^A-Za-z0-9 ]/, '')
        url = class_element.css(".card__link").attr("href").value
       
        Gym_Classes.new(title, url)
        end
    end

    def self.scrape_individual_gymclass(gymclass)
        html = open(GYM_URL+gymclass.url)
        doc = Nokogiri::HTML(html)
        gymclass.details = doc.css(".body-content").text.gsub("\n", '').gsub("\r", '').gsub("â\u0084¢", '').gsub("        ", '').gsub("      ", '').gsub(/(?!^)(?=[A-Z])/, ' ')
    end
end


