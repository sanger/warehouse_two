require 'lib/populate_delayed_job'

if Delayed::Job.count < 50
  # use the new API to find out the number of records
  create_delayed_jobs(PlatePurpose, 1)
  create_delayed_jobs(AssetAudit, 10)
  create_delayed_jobs(Quota, 3)
  create_delayed_jobs(Batch, 20)
  create_delayed_jobs(Lane, 80)
  create_delayed_jobs(Plate, 250)
  create_delayed_jobs(Project, 1)
  create_delayed_jobs(Study, 2)
  create_delayed_jobs(TagInstance, 16)
  create_delayed_jobs(Tag, 1)
  create_delayed_jobs(MultiplexedLibraryTube, 5)
  create_delayed_jobs(LibraryTube, 80)
  create_delayed_jobs(SampleTube, 80)
  create_delayed_jobs(BatchRequest, 500)
  create_delayed_jobs(PulldownMultiplexedLibraryTube, 5)
  create_delayed_jobs(Sample, 2200)
  create_delayed_jobs(Well, 5000)
  create_delayed_jobs(AssetLink, 5400)
  create_delayed_jobs(Request, 5800)
  create_delayed_jobs(StudySample, 2200)
  create_delayed_jobs(BillingEvent, 160)
  create_delayed_jobs(Event, 200)
  create_delayed_jobs(Submission, 40)
end




