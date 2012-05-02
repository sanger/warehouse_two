require 'spec_helper'

describe Study do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :id => :internal_id, :sac_sponsor => :faculty_sponsor
  it_behaves_like 'ignores JSON fields', [
    :projects,
    :commercially_available,
    :samples
  ]

  it_behaves_like 'associated with roles' do
    let(:additional_roles) { [ :data_access_contact, :slf_manager ] }
  end

  let(:json) do
    {
      :uuid => "11111111-2222-3333-4444-555555555555",
      :id => 1,
      :name => "name",
      :reference_genome => "reference genome",
      :ethically_approved => true,
      :sac_sponsor => "faculty sponsor",
      :state => "state",
      :study_type => "study type",
      :abstract => "abstract",
      :abbreviation => "abbreviation",
      :accession_number => "accession number",
      :description => "description",
      :updated_at => "2012-03-11 10:20:08",
      :created_at => "2012-03-11 10:20:08",
      :contains_human_dna => "contains human dna",
      :contaminated_human_dna => "contaminated human dna",
      :data_release_strategy => "data release strategy",
      :data_release_sort_of_study => "data release sort of study",
      :data_release_timing => "data release timing",
      :data_release_delay_period => "data release delay period",
      :data_release_delay_reason => "data release delay reason",
      :ena_project_id => "ena project id",
      :study_title => "study title",
      :study_visibility => "study visibility",
      :ega_dac_accession_number => "ega dac accession number",
      :array_express_accession_number => "array express accession number",
      :ega_policy_accession_number => "ega policy accession number"
    }
  end
end
