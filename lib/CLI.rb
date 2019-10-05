
require "pry"
require 'colorize'


class CLI

    def run
        classes = []
        puts " "
        puts "_________________________________________________".blue
        puts " "
        puts "      Welcome to your gym classes database!".yellow
        puts "_________________________________________________".blue
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
        puts "Please select a class to see class details.".green
        puts " "
        input = gets.chomp
        gymclass = Gym_Classes.all[input.to_i-1]

        if !gymclass
            puts " "
            puts "Class not found. Please select another class!".red
            puts " "
            menu
            puts " "

        else
            Scraper.scrape_individual_gymclass(gymclass)
            puts " "
            puts "Here are some details about your #{gymclass.title} class!".green
            puts " "
            puts "#{gymclass.details}".yellow
        end
        more_info
    end    

    def more_info
        puts " "
        puts "Would you like to some information on another gym class?".green
        puts " " 
        puts "Enter Y or N".blue
        puts " "

        input = gets.chomp.downcase
        
        if input == "y"
            puts " "
            Gym_Classes.all.each.with_index(1) do |gymclass, i|
                puts "#{i}"   ". " "#{gymclass.title}"
            end
            menu

        elsif input == "n"
            puts " "
            puts "Thank you for using the gym classes database!".green
            puts "_________________________________________________".blue
            puts " "
            puts "                Have a great day!".yellow
            puts "_________________________________________________".blue
            puts " "
            exit

        else
            puts " "
            puts "I don't understand that answer.".red
            more_info
        end
    end
end


