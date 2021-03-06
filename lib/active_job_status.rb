require "active_job_status/hooks"
require "active_job_status/trackable_job"
require "active_job_status/job_tracker"
require "active_job_status/job_status"
require "active_job_status/job_batch"
require "active_job_status/version"
require "active_job_status/configure_redis" if defined? Rails

module ActiveJobStatus
  class << self
    attr_accessor :store, :expiration

    def get_status(job_id)
      fetch(job_id).status
    end

    def fetch(job_id)
      status = store.fetch(job_id)
      JobStatus.new(status)
    end
  end
end
