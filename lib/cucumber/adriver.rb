module Cucumber
    module Adriver
    end
end

begin
    require 'cucumber/nagios/steps'
    require 'cucumber/adriver/version'
    require 'cucumber/adriver/steps'
    require 'cucumber/adriver/command'
    require 'sys/proctable'
    require 'etc'
    include Sys

rescue LoadError => e
    dep = e.message.split.last
    puts "You don't appear to have #{dep} installed."
    puts "Perhaps run `bundle install` or `gem install #{dep}`?"
    exit 2
end
