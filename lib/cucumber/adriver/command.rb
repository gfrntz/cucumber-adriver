module Cucumber
  module Adriver
    module Command
        def procgroup(pid)
          group = {}
          group[:gid] = ProcTable.ps("#{pid}".to_i)['gid']
          group[:name] = Etc.getgrgid(group[:gid])['name']
          return group
        end

        def procname(pid)
          name = {}
          name[:uid] = ProcTable.ps("#{pid}".to_i)['uid']
          name[:procname] = Etc.getpwuid(name[:uid])['name']
          name[:cmdline] = ProcTable.ps("#{pid}".to_i)['cmdline']
          return name
        end
        module_function :procgroup, :procname
    end
  end
end
