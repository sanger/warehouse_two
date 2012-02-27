class Study < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :reference_genome   => :reference_genome,
      :ethically_approved => :ethically_approved,
      :uuid               => :uuid,
      :internal_id        => :id,
      :name               => :name,
      :faculty_sponsor    => :sac_sponsor,
      :state              => :state,
      :study_type         => :study_type,
      :abstract           => :abstract,
      :abbreviation       => :abbreviation,
      :accession_number   => :accession_number,
      :description        => :description,
      
      :contains_human_dna              => :contains_human_dna,
      :contaminated_human_dna          => :contaminated_human_dna,
      :data_release_strategy           => :data_release_strategy,
      :data_release_sort_of_study      => :data_release_sort_of_study,
      :ena_project_id                  => :ena_project_id,
      :study_title                     => :study_title,
      :study_visibility                => :study_visibility,
      :ega_dac_accession_number        => :ega_dac_accession_number,
      :array_express_accession_number  => :array_express_accession_number,
      :ega_policy_accession_number     => :ega_policy_accession_number,
      
      :last_updated       => :updated_at,
      :created            => :created_at
    }
  end

end
