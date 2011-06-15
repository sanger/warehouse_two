@submission
Feature: Update submissions

  Scenario: Create a submission then update it
    Given the "Submission" resource returns the JSON:
      """
      [
        {
          "submission":
          {
            "internal_id": 6511,
            "uuid": "11111111-1111-1111-1111-111111111111",
            "created_at": "2010-09-16T13:45:00+00:00",
            "updated_at": "2010-09-16T13:45:00+00:00",
            "created_by": "user",
            "template_name":"Library creation - Paired end sequencing",
            "state": "building",
            "study_name": "Testing submission creation",
            "study_uuid": "22222222-3333-4444-5555-000000000000",
            "project_name": "Testing submission creation",
            "project_uuid": "22222222-3333-4444-5555-000000000001",
            "asset_uuids": [
              "33333333-4444-5555-6666-000000000001",
              "33333333-4444-5555-6666-000000000002",
              "33333333-4444-5555-6666-000000000003"
            ],
            "request_options": 
            {
              "number_of_lanes": "2",
              "read_length": "54",
              "fragment_size_required": {
                "from": "150",
                "to": "250"
              },
              "library_type": "Standard",
              "insert_size": "2000",
              "sequencing_type": "Standard"
            }
          }
        }
      ]
      """
    When I connect to the "Submission" resource and save the data
    Then Submission "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id                 | 6511                                     |
      | last_updated                | 2010-09-16 13:45:00 UTC                  |
      | created                     | 2010-09-16 13:45:00 UTC                  |
      | created_by                  | user                                     |
      | template_name               | Library creation - Paired end sequencing |
      | state                       | building                                 |
      | study_name                  | Testing submission creation              |
      | study_uuid                  | 22222222-3333-4444-5555-000000000000     |
      | project_name                | Testing submission creation              |
      | project_uuid                | 22222222-3333-4444-5555-000000000001     |
      | read_length                 | 54                                       |
      | fragment_size_required_from | 150                                      |
      | fragment_size_required_to   | 250                                      |
      | library_type                | Standard                                 |
      | sequencing_type             | Standard                                 |
      | insert_size                 | 2000                                     |
      | number_of_lanes             | 2                                        |
    And submission "11111111-1111-1111-1111-111111111111" should only have the following submitted assets:
      | asset_uuid                           |
      | 33333333-4444-5555-6666-000000000001 |
      | 33333333-4444-5555-6666-000000000002 |
      | 33333333-4444-5555-6666-000000000003 |

    Given the "Submission" resource returns the JSON:
      """
      [
        {
          "submission":
          {
            "internal_id": 6511,
            "uuid": "11111111-1111-1111-1111-111111111111",
            "created_at": "2010-09-16T13:45:00+00:00",
            "updated_at": "2010-09-16T13:45:00+00:00",
            "created_by": "user",
            "template_name":"Library creation - Paired end sequencing",
            "state": "complete",
            "study_name": "Testing submission creation",
            "study_uuid": "22222222-3333-4444-5555-000000000000",
            "project_name": "Testing submission creation",
            "project_uuid": "22222222-3333-4444-5555-000000000001",
            "asset_uuids": [
              "33333333-4444-5555-6666-000000000001",
              "33333333-4444-5555-6666-000000000002",
              "33333333-4444-5555-6666-000000000003"
            ]
          }
        }
      ]
      """
    When I connect to the "Submission" resource and save the data
    Then Submission "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id                 | 6511                                     |
      | last_updated                | 2010-09-16 13:45:00 UTC                  |
      | created                     | 2010-09-16 13:45:00 UTC                  |
      | created_by                  | user                                     |
      | template_name               | Library creation - Paired end sequencing |
      | state                       | complete                                 |
      | study_name                  | Testing submission creation              |
      | study_uuid                  | 22222222-3333-4444-5555-000000000000     |
      | project_name                | Testing submission creation              |
      | project_uuid                | 22222222-3333-4444-5555-000000000001     |
      | read_length                 |                                          |
      | fragment_size_required_from |                                          |
      | fragment_size_required_to   |                                          |
      | library_type                |                                          |
      | sequencing_type             |                                          |
      | insert_size                 |                                          |
      | number_of_lanes             |                                          |
    And submission "11111111-1111-1111-1111-111111111111" should only have the following submitted assets:
      | asset_uuid                           |
      | 33333333-4444-5555-6666-000000000001 |
      | 33333333-4444-5555-6666-000000000002 |
      | 33333333-4444-5555-6666-000000000003 |

    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 6511                                                                    |
      | name         |                                                                         |
      | object_name  | submissions                                                             |
      | last_updated | 2010-09-16 13:45:00 UTC                                                 |
      | created      | 2010-09-16 13:45:00 UTC                                                 |
      
      
  Scenario Outline: Create a with no asset uuids
    Given the "Submission" resource returns the JSON:
      """
      [
        {
          "submission":
          {
            "internal_id": 6511,
            "uuid": "11111111-1111-1111-1111-111111111111",
            "created_at": "2010-09-16T13:45:00+00:00",
            <asset_uuids_data>
            "updated_at": "2010-09-16T13:45:00+00:00"
          }
        }
      ]
      """
    When I connect to the "Submission" resource and save the data
    Then submission "11111111-1111-1111-1111-111111111111" should only have the following submitted assets:
      | asset_uuid |
    Examples:
      | asset_uuids_data   |
      | "asset_uuids": [], |
      |                    |

