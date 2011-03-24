@lane
Feature: Update lanes

  Scenario: Create an lane 
    Given the "Lane" resource returns the JSON:
      """
      [{
          "lane": {
              "name": "ABC",
              "created_at": "2009-11-05T17:46:36+00:00",
              "updated_at": "2010-05-12T16:34:41+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "barcode": "12345",
              "internal_id": 1,
              "qc_state": "pending",
              "two_dimensional_barcode": null,
              "external_release": true
          }
      }]
      """
    When I connect to the "Lane" resource and save the data
    Then Lane "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id      | 1                       |
      | name             | ABC                     |
      | state            | pending                 |
      | external_release | true                    |
      | last_updated     | 2010-05-12 16:34:41 UTC |
      | created          | 2009-11-05 17:46:36 UTC |

    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 1                                                                    |
      | name         | ABC                                                                  |
      | object_name  | lanes                                                                |
      | url          | http://localhost:3000/0_5/lanes/11111111-1111-1111-1111-111111111111 |
      | last_updated | 2010-05-12 16:34:41 UTC                                              |
      | created      | 2009-11-05 17:46:36 UTC                                              |


