require 'sucker_punch'

class QueryJob
  include SuckerPunch::Job

  def perform(event)
    puts 'Running job!!!!!!!!!!!!!'
    QueryJob.perform_async('')
  end
end

class JobQueue

  def start
    puts 'Starting jobs'
    QueryJob.perform_async('')
  end

end
