set :output, "/log/cron_log.log"

every 30.days do
  rake 'voting:process_old'
end

