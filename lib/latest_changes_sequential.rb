require File.dirname(__FILE__) + '/resource_loader'
load(['Submission','Order','PlatePurpose','Quota','Batch','Lane','Project','Study','Tag', 'MultiplexedLibraryTube', 'LibraryTube','SampleTube','BillingEvent','StudySample','Event','BatchRequest','PulldownMultiplexedLibraryTube'], 1)
load(['Plate','Sample','AssetAudit','Request'], 10)
load(['Well', 'AssetLink'], 20)
load(['Aliquot'], 40)  # Assumes there are more aliquots than labware
