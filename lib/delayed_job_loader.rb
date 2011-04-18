require 'lib/populate_delayed_job'

if Delayed::Job.count < 1000
  # use the new API to find out the number of records
  create_delayed_jobs(PlatePurpose, 1)
  create_delayed_jobs(AssetAudit, 10)
  create_delayed_jobs(Quota, 6)
  create_delayed_jobs(Batch, 20)
  create_delayed_jobs(Lane, 70)
  create_delayed_jobs(Plate, 500)
  create_delayed_jobs(Project, 2)
  create_delayed_jobs(Study, 4)
  create_delayed_jobs(TagInstance, 32)
  create_delayed_jobs(Tag, 2)
  create_delayed_jobs(MultiplexedLibraryTube, 10)
  create_delayed_jobs(LibraryTube, 20)
  create_delayed_jobs(SampleTube, 20)
  create_delayed_jobs(BatchRequest, 440)
  create_delayed_jobs(PulldownMultiplexedLibraryTube, 10)
  create_delayed_jobs(Sample, 2000)
  create_delayed_jobs(Well, 1000)
  create_delayed_jobs(AssetLink, 1000)
  create_delayed_jobs(Request, 1000)
  create_delayed_jobs(StudySample, 6600)
  create_delayed_jobs(BillingEvent, 150)
  create_delayed_jobs(Event, 2000)
end 




