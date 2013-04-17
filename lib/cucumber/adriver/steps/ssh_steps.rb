Given /^I logged in on remote host with ssh$/ do
  puts "ssh to #{ENV['host']}"
  step "I can ssh to \"#{ENV['host']}\" with the following credentials:", table(%{
    | username            | keyfile       |
    | #{ENV['username']}  | ~/.ssh/id_rsa2 |
    })
end

Then /^the exit status should be '(\d+)'$/ do |code|    
    step "I run \"echo $?\""
    step "I should see \"#{code}\" in the output"
end


