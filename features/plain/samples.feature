@sample
Feature: Update Samples

  Scenario: Create a sample then update it
    Given the "Sample" resource returns the JSON:
      """
      [{
          "sample": {
            "name": "Test sample",
            "created_at": "2011-03-06T19:40:47+00:00",
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "sanger_sample_id": "ABC_123",
            "reference_genome": "",
            "organism": "",
            "control": "",
            "sample_common_name": "human",
            "sample_description": "sample description",
            "sample_ebi_accession_number": "ERS00001",
            "sample_taxon_id": "1234",
            "father": "",
            "mother": "",
            "replicate": "",
            "ethnicity": "green",
            "gender": "Female",
            "cohort": "happy people",
            "country_of_origin": "some country",
            "geographical_region": "World",
            "sample_public_name": "sample public name",
            "sample_sra_hold": "Hold",
            "sample_strain_att": "some strain",

            "id": 1
          }
      }]
      """
    When I connect to the "Sample" resource and save the data
    Then Sample "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name                | Test sample                          |
      | created             | 2011-03-06 19:40:47 UTC              |
      | last_updated        | 2011-03-06 19:40:47 UTC              |
      | uuid                | 11111111-1111-1111-1111-111111111111 |
      | sanger_sample_id    | ABC_123                              |
      | reference_genome    |                                      |
      | organism            |                                      |
      | control             |                                      |
      | common_name         | human                                |
      | description         | sample description                   |
      | accession_number    | ERS00001                             |
      | taxon_id            | 1234                                 |
      | father              |                                      |
      | mother              |                                      |
      | replicate           |                                      |
      | ethnicity           | green                                |
      | gender              | Female                               |
      | cohort              | happy people                         |
      | country_of_origin   | some country                         |
      | geographical_region | World                                |
      | public_name         | sample public name                   |
      | sample_visibility   | Hold                                 |
      | strain              | some strain                          |
      | internal_id         | 1                                    |

    Given the "Sample" resource returns the JSON:
      """
      [{
          "sample": {
            "name": "Test sample",
            "created_at": "2011-03-06T19:40:47+00:00",
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "sanger_sample_id": "ABC_123",
            "reference_genome": "",
            "organism": "",
            "control": "",
            "sample_common_name": "human",
            "sample_description": "sample description",
            "sample_ebi_accession_number": "ERS00002",
            "sample_taxon_id": "5555",
            "father": "",
            "mother": "",
            "replicate": "",
            "ethnicity": "green",
            "gender": "Female",
            "cohort": "happy people",
            "country_of_origin": "some country",
            "geographical_region": "World",
            "sample_public_name": "sample public name",
            "sample_sra_hold": "Public",
            "sample_strain_att": "some strain",
            "id": 1
          }
      }]
      """
    When I connect to the "Sample" resource and save the data
    Then Sample "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name                | Test sample                          |
      | created             | 2011-03-06 19:40:47 UTC              |
      | last_updated        | 2011-03-06 19:40:47 UTC              |
      | uuid                | 11111111-1111-1111-1111-111111111111 |
      | sanger_sample_id    | ABC_123                              |
      | reference_genome    |                                      |
      | organism            |                                      |
      | control             |                                      |
      | common_name         | human                                |
      | description         | sample description                   |
      | accession_number    | ERS00002                             |
      | taxon_id            | 5555                                 |
      | father              |                                      |
      | mother              |                                      |
      | replicate           |                                      |
      | ethnicity           | green                                |
      | gender              | Female                               |
      | cohort              | happy people                         |
      | country_of_origin   | some country                         |
      | geographical_region | World                                |
      | public_name         | sample public name                   |
      | sample_visibility   | Public                               |
      | strain              | some strain                          |
      | internal_id         | 1                                    |

    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name         | Test sample                                                              |
      | object_name  | samples                                                                  |
      | last_updated | 2011-03-06 19:40:47 UTC                                                |
      | created      | 2011-03-06 19:40:47 UTC                                                |

