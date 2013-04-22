# Example:
#   When I have parent pid in pidfile "/var/run/foo.pid"
#
When /^I have parent pid in pidfile "(.*?)"$/ do |pid|
  @ppid = File.open(pid).read.chomp
  puts @ppid

  raise "Parent pid not found" if @ppid.empty?
end

When /^cmd line must be "(.*?)"$/ do |cmdline|
  cmdline.should eq(Cucumber::Adriver::Command.procname(@ppid)[:cmdline])
end

When /^child pids count must be "(.*?)"$/ do |chpid|
  @child_pids = `ps -o pid --ppid #{@ppid}`.split("\n").reject do |pid|
        /\D/.match pid
  end

  puts @child_pids
  puts @child_pids.size

  @child_pids.size.should eq(chpid.to_i)
end

When /^child pid owner must be "(.*?)"$/ do |owner|
  @child_pids.each do |pid|
    owner.should be(Cucumber::Adriver::Command.procgroup(pid)[:name])
  end
end

