@study
Feature: Update Studies

  Scenario: Create a study then update it
    Given the "Study" resource returns the JSON:
      """
      [{
          "study": {
            "reference_genome": "reference",
            "study_type": "sequencing",
            "name": "ABC",
            "ethically_approved": false,
            "created_at": "2011-01-20T15:39:11+00:00",
            "data_release_strategy": "open",
            "updated_at": "2011-02-16T10:10:55+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "projects": "http://localhost:3000/0_5/studies/11111111-1111-1111-1111-111111111111/projects",
            "abstract": "some abstract",
            "abbreviation": "1726STDY",
            "sac_sponsor": "HIJ",
            "contains_human_dna": "No",
            "id": 1726,
            "accession_number": "",
            "contaminated_human_dna": "No",
            "description": "xxx",
            "samples": "http://localhost:3000/0_5/studies/11111111-1111-1111-1111-111111111111/samples",
            "data_release_sort_of_study": "genomic sequencing",
            "state": "active"
          }
      }]
      """
    When I connect to the "Study" resource and save the data
    Then Study "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | reference_genome           | reference                            |
      | study_type                 | sequencing                           |
      | name                       | ABC                                  |
      | ethically_approved         | false                                |
      | created                    | 2011-01-20 15:39:11 UTC              |
      | data_release_strategy      | open                                 |
      | last_updated               | 2011-02-16 10:10:55 UTC              |
      | uuid                       | 11111111-1111-1111-1111-111111111111 |
      | abstract                   | some abstract                        |
      | abbreviation               | 1726STDY                             |
      | contains_human_dna         | No                                   |
      | accession_number           |                                      |
      | contaminated_human_dna     | No                                   |
      | description                | xxx                                  |
      | data_release_sort_of_study | genomic sequencing                   |
      | state                      | active                               |

 

    Given the "Study" resource returns the JSON:
      """
      [{
          "study": {
            "reference_genome": "reference",
            "study_type": "sequencing",
            "name": "ABC",
            "ethically_approved": false,
            "created_at": "2011-01-20T15:39:11+00:00",
            "data_release_strategy": "open",
            "updated_at": "2011-02-16T10:10:55+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "projects": "http://localhost:3000/0_5/studies/11111111-1111-1111-1111-111111111111/projects",
            "abstract": "some abstract",
            "abbreviation": "EFG",
            "sac_sponsor": "HIJ",
            "contains_human_dna": "Yes",
            "accession_number": "",
            "contaminated_human_dna": "Yes",
            "description": "xxx",
            "samples": "http://localhost:3000/0_5/studies/11111111-1111-1111-1111-111111111111/samples",
            "data_release_sort_of_study": "genomic sequencing",
            "state": "active"
          }
      }]
      """
    When I connect to the "Study" resource and save the data
    Then Study "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | reference_genome           | reference                            |
      | study_type                 | sequencing                           |
      | name                       | ABC                                  |
      | ethically_approved         | false                                |
      | created                    | 2011-01-20 15:39:11 UTC              |
      | data_release_strategy      | open                                 |
      | last_updated               | 2011-02-16 10:10:55 UTC              |
      | uuid                       | 11111111-1111-1111-1111-111111111111 |
      | abstract                   | some abstract                        |
      | abbreviation               | EFG                                  |
      | contains_human_dna         | Yes                                  |
      | accession_number           |                                      |
      | contaminated_human_dna     | Yes                                  |
      | description                | xxx                                  |
      | data_release_sort_of_study | genomic sequencing                   |
      | state                      | active                               |


    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name         | ABC                     |
      | object_name  | studies                 |
      | last_updated | 2011-02-16 10:10:55 UTC |
      | created      | 2011-01-20 15:39:11 UTC |



