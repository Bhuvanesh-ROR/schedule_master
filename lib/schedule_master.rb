# frozen_string_literal: true

# require_relative "schedule_master/version"
#
# module ScheduleMaster
#   class Error < StandardError; end
#   # Your code goes here...
# end

# lib/job_scheduler.rb
require 'rufus-scheduler'

class JobScheduler
  def initialize
    @scheduler = Rufus::Scheduler.new
    @jobs = []
  end

  def schedule(cron_expression, &block)
    # Schedule the job using rufus-scheduler
    @scheduler.cron(cron_expression, &block)

    # Store the job and block in @jobs array
    @jobs << { cron_expression: cron_expression, block: block }
  end

  def run
    # Start the scheduler
    @scheduler.join
  end
end
