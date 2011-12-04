module MCollective
    module Agent
        class Misc<RPC::Agent
            metadata    :name        => "Misc commands",
                        :description => "Misc commands", 
                        :author      => "Omry Yadan <omry@yadan.net>",
                        :license     => "",
                        :version     => "1.0",
                        :url         => "?",
                        :timeout     => 2

            action "reboot" do
				run("reboot")
            end

            action "uptime" do
				run("uptime")
            end

			def run(cmd)
				begin
					reply[:cmd] = cmd
					reply[:text] = %x[#{cmd}]
				rescue Exception => e
					logger.error(e)
					logger.error(e.backtrace.join("\n\t"))
					raise
				end
			end
        end
    end
end