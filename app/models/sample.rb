class Sample < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id         => :id,
      :name                => :name,
      :sanger_sample_id    => :sanger_sample_id,
      :reference_genome    => :reference_genome,
      :organism            => :organism,
      :control             => :control,
      :common_name         => :sample_common_name,
      :description         => :sample_description,
      :accession_number    => :sample_ebi_accession_number,
      :taxon_id            => :sample_taxon_id,
      :father              => :father,
      :mother              => :mother,
      :replicate           => :replicate,
      :ethnicity           => :ethnicity,
      :gender              => :gender,
      :cohort              => :cohort,
      :country_of_origin   => :country_of_origin,
      :geographical_region => :geographical_region,
      :public_name         => :sample_public_name,
      :sample_visibility   => :sample_sra_hold,
      :strain              => :sample_strain_att,
      :supplier_name       => :supplier_name,
      :updated_by_manifest => :updated_by_manifest
    }
  end
  
end
