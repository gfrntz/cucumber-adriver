module Cucumber
    module Adriver
    end
end

begin
    require 'cucumber/adriver/version'
    require 'cucumber/adriver/steps'
rescue LoadError => e
    exit 2
end