When /^I have parent pid "(.*?)"$/ do |pid|
  @ppid = File.open(pid).read.chomp
  puts @ppid

  raise "Parent pid not found" if @ppid.empty?
end

When /^cmd line must be "(.*?)"$/ do |cmdline|
  if cmdline == Cucumber::Adriver::Command.procname(@ppid)[:cmdline]
        puts cmdline
  else
        raise "Cmd line error"
  end
end

When /^child pids count must be "(.*?)"$/ do |chpid|
  @child_pids = `ps -o pid --ppid #{@ppid}`.split("\n").reject do |pid|
        /\D/.match pid
  end

  p @child_pids

  puts @child_pids.size

  if @child_pids.size == chpid.to_i
    puts "Procs count true"
  else
    raise "Proc count #{chpid}"
  end
end

When /^child pid owner must be "(.*?)"$/ do |owner|
  @child_pids.each do |pid|
    raise if owner != Cucumber::Adriver::Command.procgroup(pid)[:name]
  end
end

