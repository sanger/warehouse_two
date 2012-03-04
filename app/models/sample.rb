class Sample < ActiveRecord::Base
  include ResourceTools

  json do
    translate(
      :sample_common_name          => :common_name,
      :sample_description          => :description,
      :sample_ebi_accession_number => :accession_number,
      :sample_taxon_id             => :taxon_id,
      :sample_public_name          => :public_name,
      :sample_sra_hold             => :sample_visibility,
      :sample_strain_att           => :strain
    )
  end
end
