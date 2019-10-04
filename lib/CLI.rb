
require "pry"

class CLI

    def run
        classes = []
        puts " "
        puts "Welcome to your gym classes database!"
        puts " "
        puts "Which class would you like to learn more about?"
        puts " "
        Scraper.scrape_gym
        Gym_Classes.all.each.with_index(1) do |gymclass, i|
        puts "#{i}"   ". " "#{gymclass.title}"
        end
        menu
        puts " "
    end

    def menu
        puts " "
        puts "Please select a class to see booking details."
        input = gets.chomp
        gymclass = Gym_Classes.all[input.to_i-1]

        if !gymclass
            puts "Class not found. Please select another class!"
            menu
            puts " "
        else
            Scraper.scrape_individual_gymclass(gymclass)
            puts " "
            puts "Here are some details about your #{gymclass.title} class!"
            puts " "
            puts "#{gymclass.details}"
        end
    end

end


