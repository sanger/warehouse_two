require 'lib/populate_delayed_job'

if Delayed::Job.count < 500
  # use the new API to find out the number of records
  create_delayed_jobs(PlatePurpose, 1)
  create_delayed_jobs(AssetAudit, 5)
  create_delayed_jobs(Quota, 3)
  create_delayed_jobs(Batch, 10)
  create_delayed_jobs(Lane, 35)
  create_delayed_jobs(Plate, 250)
  create_delayed_jobs(Project, 1)
  create_delayed_jobs(Study, 2)
  create_delayed_jobs(TagInstance, 16)
  create_delayed_jobs(Tag, 1)
  create_delayed_jobs(MultiplexedLibraryTube, 5)
  create_delayed_jobs(LibraryTube, 10)
  create_delayed_jobs(SampleTube, 10)
  create_delayed_jobs(BatchRequest, 220)
  create_delayed_jobs(PulldownMultiplexedLibraryTube, 5)
  create_delayed_jobs(Sample, 1000)
  create_delayed_jobs(Well, 500)
  create_delayed_jobs(AssetLink, 500)
  create_delayed_jobs(Request, 500)
  create_delayed_jobs(StudySample, 3300)
  create_delayed_jobs(BillingEvent, 75)
  create_delayed_jobs(Event, 1000)
end




