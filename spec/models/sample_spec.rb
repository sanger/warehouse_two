require 'spec_helper'

describe Sample do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', {
    :sample_common_name          => :common_name,
    :sample_description          => :description,
    :sample_ebi_accession_number => :accession_number,
    :sample_taxon_id             => :taxon_id,
    :sample_public_name          => :public_name,
    :sample_sra_hold             => :sample_visibility,
    :sample_strain_att           => :strain
  }
  it_behaves_like 'ignores JSON fields', [
    :new_name_format,
    :gc_content,
    :sample_manifest_id,
    :supplier_plate_id,
    :dna_source,
    :sample_tubes,
    :volume
  ]

  let(:json) do
    {
      :uuid                        => "11111111-2222-3333-4444-555555555555",
      :internal_id                 => 1,
      :name                        => "name",
      :reference_genome            => "reference genome",
      :organism                    => "organism",
      :sample_ebi_accession_number => "accession number",
      :sample_common_name          => "common name",
      :sample_description          => "description",
      :sample_taxon_id             => "taxon id",
      :father                      => "father",
      :mother                      => "mother",
      :replicate                   => "replicate",
      :ethnicity                   => "ethnicity",
      :gender                      => "gender",
      :cohort                      => "cohort",
      :country_of_origin           => "country of origin",
      :geographical_region         => "geographical region",
      :updated_at                  => "2012-03-11 10:22:42",
      :created_at                  => "2012-03-11 10:22:42",
      :sanger_sample_id            => "sanger sample id",
      :control                     => true,
      :empty_supplier_sample_name  => true,
      :supplier_name               => "supplier name",
      :sample_public_name          => "public name",
      :sample_sra_hold             => "sample visibility",
      :sample_strain_att           => "strain",
      :updated_by_manifest         => true
    }
  end
end
