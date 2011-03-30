@request
Feature: Update requests

  Scenario Outline: Save the state of a request
    Given the "Request" resource exists
    When I connect to the "Request" resource and save the data
    Then the state of request "<uuid>" is "<state>"
    Examples:
      | state   | uuid                                 |
      | pending | 11111111-1111-1111-1111-111111111111 |
      | passed  | 11111111-1111-1111-1111-111111111112 |
      | failed  | 11111111-1111-1111-1111-111111111113 |
      | started | 11111111-1111-1111-1111-111111111114 |

  Scenario: Create a request then update it
    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "state": "passed",
              "target_asset_closed": false,
              "target_asset_state": "pending",
              "project_url": "http://localhost:3000/0_5/projects/111111111111",
              "created_at": "2008-04-02T17:07:04+00:00",
              "source_asset_two_dimensional_barcode": null,
              "source_asset_barcode": "1",
              "study_name": "ABC",
              "updated_at": "2009-11-05T17:40:40+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "target_asset_barcode": null,
              "target_asset_type": "lanes",
              "project_uuid": "111111111111",
              "source_asset_closed": false,
              "source_asset_type": "library_tubes",
              "read_length": "1",
              "target_asset_two_dimensional_barcode": null,
              "id": 1234,
              "project_internal_id": 5,
              "target_asset_uuid": "2222222222222222",
              "source_asset_uuid": "333333333333333",
      				"target_asset_internal_id": 1234,
      				"source_asset_internal_id": 5,
              "study_url": "http://localhost:3000/0_5/studies/444444444444444",
              "study_uuid": "444444444444444",
      				"study_internal_id": 123,
      				"fragment_size_required_from": 100,
              "fragment_size_required_to": 200,
              "library_type": "Standard",
              "project_name": "ABC",
              "source_asset_sample_uuid": "55555555555555555555",
      				"source_asset_sample_internal_id": 6,
      				"target_asset_sample_internal_id": 123,
              "target_asset_name": "ABCDEFG",
              "source_asset_state": "pending",
              "source_asset_name": "ABCDEFGHI",
              "request_type": "Paired end sequencing",
              "source_asset_barcode_prefix": "NT",
              "target_asset_barcode_prefix": "XT",
              "target_asset_sample_uuid": "55555555555555555555",
              "priority": 1,
              "user": "abc"
          }
      }]
      """
    When I connect to the "Request" resource and save the data
    Then Request "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id                          | 1234                    |
      | request_type                         | Paired end sequencing   |
      | state                                | passed                  |
      | fragment_size_from                   | 100                     |
      | fragment_size_to                     | 200                     |
      | read_length                          | 1                       |
      | library_type                         | Standard                |
      | study_uuid                           | 444444444444444         |
      | study_internal_id                    | 123                     |
      | study_name                           | ABC                     |
      | project_uuid                         | 111111111111            |
      | project_internal_id                  | 5                       |
      | project_name                         | ABC                     |
      | source_asset_uuid                    | 333333333333333         |
      | source_asset_internal_id             | 5                    |
      | source_asset_type                    | library_tubes           |
      | source_asset_name                    | ABCDEFGHI               |
      | source_asset_barcode                 | 1                       |
      | source_asset_barcode_prefix          | NT                      |
      | source_asset_state                   | pending                 |
      | source_asset_closed                  | 0                       |
      | source_asset_two_dimensional_barcode |                         |
      | source_asset_sample_uuid             | 55555555555555555555    |
      | source_asset_sample_internal_id      | 6                       |
      | target_asset_uuid                    | 2222222222222222        |
      | target_asset_internal_id             | 1234                    |
      | target_asset_type                    | lanes                   |
      | target_asset_name                    | ABCDEFG                 |
      | target_asset_barcode                 |                         |
      | target_asset_barcode_prefix          | XT                      |
      | target_asset_state                   | pending                 |
      | target_asset_closed                  | 0                       |
      | target_asset_two_dimensional_barcode |                         |
      | target_asset_sample_uuid             | 55555555555555555555    |
      | target_asset_sample_internal_id      | 123                     |
      | priority                             | 1                       |
      | user                                 | abc                     |
      | last_updated                         | 2009-11-05 17:40:40 UTC |
      | created                              | 2008-04-02 17:07:04 UTC |


    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "state": "started",
              "target_asset_closed": false,
              "target_asset_state": "started",
              "project_url": "http://localhost:3000/0_5/projects/4444444444444",
              "created_at": "2008-04-02T17:07:04+00:00",
              "source_asset_two_dimensional_barcode": null,
              "source_asset_barcode": "1",
              "study_name": "ABC",
              "updated_at": "2010-10-01T12:00:00+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "target_asset_barcode": null,
              "target_asset_type": "lanes",
              "project_uuid": "4444444444444",
              "source_asset_closed": false,
              "source_asset_type": "library_tubes",
              "read_length": "1",
              "target_asset_two_dimensional_barcode": null,
              "id": 1234,
              "project_internal_id": 888,
              "target_asset_uuid": "777777777777777",
              "source_asset_uuid": "666666666666666666",
      				"target_asset_internal_id": 1234,
      				"source_asset_internal_id": 5,
              "study_url": "http://localhost:3000/0_5/studies/55555555555555",
              "study_uuid": "55555555555555",
      				"study_internal_id": 999,
      				"fragment_size_required_from": 100,
              "fragment_size_required_to": 200,
              "library_type": "Standard",
              "project_name": "ABC",
              "source_asset_sample_uuid": "8888888888888888",
      				"source_asset_sample_internal_id": 6,
      				"target_asset_sample_internal_id": 123,
              "target_asset_name": "ABCDEFG",
              "source_asset_state": "started",
              "source_asset_name": "ABCDEFGHI",
              "request_type": "Paired end sequencing",
              "source_asset_barcode_prefix": "NT",
              "target_asset_barcode_prefix": "XT",
              "target_asset_sample_uuid": "8888888888888888"
          }
      }]
      """
    When I connect to the "Request" resource and save the data
    Then Request "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id                          | 1234                    |
      | request_type                         | Paired end sequencing   |
      | state                                | started                 |
      | fragment_size_from                   | 100                     |
      | fragment_size_to                     | 200                     |
      | read_length                          | 1                       |
      | library_type                         | Standard                |
      | study_uuid                           | 55555555555555          |
      | study_internal_id                    | 999                     |
      | study_name                           | ABC                     |
      | project_uuid                         | 4444444444444           |
      | project_internal_id                  | 888                     |
      | project_name                         | ABC                     |
      | source_asset_uuid                    | 666666666666666666      |
      | source_asset_internal_id             | 5                       |
      | source_asset_type                    | library_tubes           |
      | source_asset_name                    | ABCDEFGHI               |
      | source_asset_barcode                 | 1                       |
      | source_asset_barcode_prefix          | NT                      |
      | source_asset_state                   | started                 |
      | source_asset_closed                  | 0                       |
      | source_asset_two_dimensional_barcode |                         |
      | source_asset_sample_uuid             | 8888888888888888        |
      | source_asset_sample_internal_id      | 6                       |
      | target_asset_uuid                    | 777777777777777         |
      | target_asset_internal_id             | 1234                    |
      | target_asset_type                    | lanes                   |
      | target_asset_name                    | ABCDEFG                 |
      | target_asset_barcode                 |                         |
      | target_asset_barcode_prefix          | XT                      |
      | target_asset_state                   | started                 |
      | target_asset_closed                  | 0                       |
      | target_asset_two_dimensional_barcode |                         |
      | target_asset_sample_uuid             | 8888888888888888        |
      | target_asset_sample_internal_id      | 123                     |
      | last_updated                         | 2010-10-01 12:00:00 UTC |
      | created                              | 2008-04-02 17:07:04 UTC |

    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 1234                                                                    |
      | name         |                                                                         |
      | object_name  | requests                                                                |
      | last_updated | 2009-11-05 17:40:40 UTC                                                 |
      | created      | 2008-04-02 17:07:04 UTC                                                 |


  Scenario: Link source and target assets
    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "source_asset_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_internal_id": 99,
              "source_asset_type": "sample_tubes",
              "target_asset_uuid": "33333333-1111-1111-1111-111111111111",
              "target_asset_internal_id": 234,
              "target_asset_type": "lanes"
          }
      }]
      """
   When I connect to the "Request" resource and save the data
   Then an assetlink should exist between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111"
   And the link between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111" should contain:
     | ancestor_uuid          | 22222222-1111-1111-1111-111111111111 |
     | ancestor_internal_id   | 99                                  |
     | ancestor_type          | sample_tubes                         |
     | descendant_uuid        | 33333333-1111-1111-1111-111111111111 |
     | descendant_internal_id | 234                                  |
     | descendant_type        | lanes                                |
   Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse


  Scenario: Link source and target assets where neither are available
    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "source_asset_uuid": "",
              "target_asset_uuid": ""
          }
      }]
      """
    When I connect to the "Request" resource and save the data
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse


  Scenario: Link source and target assets where source is only given
    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "source_asset_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_internal_id": 99,
              "source_asset_type": "sample_tubes",
              "target_asset_uuid": "",
              "target_asset_internal_id": ,
              "target_asset_type": ""
          }
      }]
      """
    When I connect to the "Request" resource and save the data
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse

  Scenario: Link source and target assets where target is only given
    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "source_asset_uuid": "",
              "source_asset_internal_id": ,
              "source_asset_type": "",
              "target_asset_uuid": "33333333-1111-1111-1111-111111111111",
              "target_asset_internal_id": 234,
              "target_asset_type": "lanes"
          }
      }]
      """
    When I connect to the "Request" resource and save the data
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse


  Scenario: Link source and target assets where the internal_ids are missing
    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "source_asset_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_internal_id": ,
              "source_asset_type": "sample_tubes",
              "target_asset_uuid": "33333333-1111-1111-1111-111111111111",
              "target_asset_type": "lanes"
          }
      }]
      """
    When I connect to the "Request" resource and save the data
    Then an assetlink should exist between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111"
    And the link between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111" should contain:
      | ancestor_uuid          | 22222222-1111-1111-1111-111111111111 |
      | ancestor_internal_id   |                                      |
      | ancestor_type          | sample_tubes                         |
      | descendant_uuid        | 33333333-1111-1111-1111-111111111111 |
      | descendant_internal_id |                                      |
      | descendant_type        | lanes                                |
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse


  Scenario: Link source and target assets where the asset types are missing
    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "source_asset_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_internal_id": 99,
              "source_asset_type": ,
              "target_asset_uuid": "33333333-1111-1111-1111-111111111111",
              "target_asset_internal_id": 234,
              "target_asset_type": ""
          }
      }]
      """
    When I connect to the "Request" resource and save the data
    Then an assetlink should exist between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111"
    And the link between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111" should contain:
      | ancestor_uuid          | 22222222-1111-1111-1111-111111111111 |
      | ancestor_internal_id   | 99                                  |
      | ancestor_type          |                                      |
      | descendant_uuid        | 33333333-1111-1111-1111-111111111111 |
      | descendant_internal_id | 234                                  |
      | descendant_type        |                                      |
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse


  Scenario: Link source and target assets where the link already exists
    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "uuid": "11111111-1111-1111-1111-222222222222",
              "source_asset_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_internal_id": 99,
              "source_asset_type": ,
              "target_asset_uuid": "33333333-1111-1111-1111-111111111111",
              "target_asset_internal_id": 234,
              "target_asset_type": ""
          }
      }]
      """
    When I connect to the "Request" resource and save the data
    Then an assetlink should exist between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111"
    And the link between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111" should contain:
      | ancestor_uuid          | 22222222-1111-1111-1111-111111111111 |
      | ancestor_internal_id   | 99                                  |
      | ancestor_type          |                                      |
      | descendant_uuid        | 33333333-1111-1111-1111-111111111111 |
      | descendant_internal_id | 234                                  |
      | descendant_type        |                                      |
    Then I should be able to find UUID "11111111-1111-1111-1111-222222222222" in "Request" the warehouse
    Given the "Request" resource returns the JSON:
      """
      [{
          "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "source_asset_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_internal_id": 99,
              "source_asset_type": ,
              "target_asset_uuid": "33333333-1111-1111-1111-111111111111",
              "target_asset_internal_id": 234,
              "target_asset_type": ""
          }
      }]
      """
    When I connect to the "Request" resource and save the data
    Then an assetlink should exist between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111"
    And the link between assets "22222222-1111-1111-1111-111111111111" and "33333333-1111-1111-1111-111111111111" should contain:
      | ancestor_uuid          | 22222222-1111-1111-1111-111111111111 |
      | ancestor_internal_id   | 99                                  |
      | ancestor_type          |                                      |
      | descendant_uuid        | 33333333-1111-1111-1111-111111111111 |
      | descendant_internal_id | 234                                  |
      | descendant_type        |                                      |
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse
    And the asset link table should be of size 1


  Scenario: Link study and source sample through the source and target assets
    Given the "Request" resource returns the JSON:
       """
       [{
           "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "study_uuid": "44444444-1111-1111-1111-111111111111",
              "study_internal_id": 123,
              "source_asset_sample_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_sample_internal_id": 6,
              "target_asset_sample_uuid": "33333333-1111-1111-1111-111111111111",
              "target_asset_sample_internal_id": 789
           }
       }]
       """
    When I connect to the "Request" resource and save the data
    Then a study sample link should exist between study "44444444-1111-1111-1111-111111111111" and sample "33333333-1111-1111-1111-111111111111"
    And the link between study "44444444-1111-1111-1111-111111111111" and sample "33333333-1111-1111-1111-111111111111" should contain:
      | sample_uuid          | 33333333-1111-1111-1111-111111111111 |
      | sample_internal_id   | 789                                  |
      | study_uuid           | 44444444-1111-1111-1111-111111111111 |
      | study_internal_id    | 123                                  |

    Then a study sample link should exist between study "44444444-1111-1111-1111-111111111111" and sample "22222222-1111-1111-1111-111111111111"
    And the link between study "44444444-1111-1111-1111-111111111111" and sample "22222222-1111-1111-1111-111111111111" should contain:
      | sample_uuid          | 22222222-1111-1111-1111-111111111111 |
      | sample_internal_id   | 6                                  |
      | study_uuid           | 44444444-1111-1111-1111-111111111111 |
      | study_internal_id    | 123                                  |
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse


  Scenario: Link study and samples where neither are available
    Given the "Request" resource returns the JSON:
       """
       [{
           "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "study_uuid": "",
              "study_internal_id": ,
              "source_asset_sample_uuid": "",
              "source_asset_sample_internal_id": ,
              "target_asset_sample_uuid": "",
              "target_asset_sample_internal_id":
           }
       }]
       """
    When I connect to the "Request" resource and save the data
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse
    Then the study sample table should be of size 0


  Scenario: Link study and samples where study is only given
    Given the "Request" resource returns the JSON:
       """
       [{
           "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "study_uuid": "44444444-1111-1111-1111-111111111111",
              "study_internal_id": 123
           }
       }]
       """
    When I connect to the "Request" resource and save the data
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse
    Then the study sample table should be of size 0


  Scenario: Link study and samples where sample is only given
    Given the "Request" resource returns the JSON:
       """
       [{
           "request": {
             "uuid": "11111111-1111-1111-1111-111111111111",
             "source_asset_sample_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_sample_internal_id": 6,
             "target_asset_sample_uuid": "33333333-1111-1111-1111-111111111111",
             "target_asset_sample_internal_id": 789
           }
       }]
       """
    When I connect to the "Request" resource and save the data
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse
    Then the study sample table should be of size 0

  Scenario: Link study and samples where the samples are the same
    Given the "Request" resource returns the JSON:
       """
       [{
           "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "study_uuid": "44444444-1111-1111-1111-111111111111",
              "study_internal_id": 123,
              "source_asset_sample_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_sample_internal_id": 6,
              "target_asset_sample_uuid": "22222222-1111-1111-1111-111111111111",
              "target_asset_sample_internal_id": 6
           }
       }]
       """
    When I connect to the "Request" resource and save the data
    Then a study sample link should exist between study "44444444-1111-1111-1111-111111111111" and sample "22222222-1111-1111-1111-111111111111"
    And the link between study "44444444-1111-1111-1111-111111111111" and sample "22222222-1111-1111-1111-111111111111" should contain:
      | sample_uuid          | 22222222-1111-1111-1111-111111111111 |
      | sample_internal_id   | 6                                  |
      | study_uuid           | 44444444-1111-1111-1111-111111111111 |
      | study_internal_id    | 123                                  |
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse


  Scenario: Link study and samples where the internal ids are not present
    Given the "Request" resource returns the JSON:
       """
       [{
           "request": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "study_uuid": "44444444-1111-1111-1111-111111111111",
              "study_internal_id": ,
              "source_asset_sample_uuid": "22222222-1111-1111-1111-111111111111",
              "source_asset_sample_internal_id": ,
              "target_asset_sample_uuid": "33333333-1111-1111-1111-111111111111",
              "target_asset_sample_internal_id":
           }
       }]
       """
    When I connect to the "Request" resource and save the data
    Then a study sample link should exist between study "44444444-1111-1111-1111-111111111111" and sample "33333333-1111-1111-1111-111111111111"
    And the link between study "44444444-1111-1111-1111-111111111111" and sample "33333333-1111-1111-1111-111111111111" should contain:
      | sample_uuid          | 33333333-1111-1111-1111-111111111111 |
      | sample_internal_id   |                                      |
      | study_uuid           | 44444444-1111-1111-1111-111111111111 |
      | study_internal_id    |                                      |

    Then a study sample link should exist between study "44444444-1111-1111-1111-111111111111" and sample "22222222-1111-1111-1111-111111111111"
    And the link between study "44444444-1111-1111-1111-111111111111" and sample "22222222-1111-1111-1111-111111111111" should contain:
      | sample_uuid          | 22222222-1111-1111-1111-111111111111 |
      | sample_internal_id   |                                      |
      | study_uuid           | 44444444-1111-1111-1111-111111111111 |
      | study_internal_id    |                                      |
    Then I should be able to find UUID "11111111-1111-1111-1111-111111111111" in "Request" the warehouse
