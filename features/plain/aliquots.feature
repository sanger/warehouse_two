@aliquot
Feature: Update aliquots

  Scenario: Create an aliquot
    Given the "Aliquot" resource returns the JSON:
      """
      [{
          "aliquot": {
              "created_at": "2009-11-05T17:46:36+00:00",
              "updated_at": "2010-05-12T16:34:41+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "study_uuid": "444444444444444",
              "study_internal_id": 123,
              ""
          }
      }]
      """
    When I connect to the "Aliquot" resource and save the data
    Then Aliquot "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id      | 1                       |
      | last_updated     | 2010-05-12 16:34:41 UTC |
      | created          | 2009-11-05 17:46:36 UTC |

    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id      | 1                       |
      | last_updated     | 2010-05-12 16:34:41 UTC |
      | created          | 2009-11-05 17:46:36 UTC |


  @external_release
  Scenario Outline: Create an aliquot and update the external release value
    Given the "Aliquot" resource returns the JSON:
      """
      [{
          "Aliquot": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "external_release": <original_value>
          }
      }]
      """
    When I connect to the "Aliquot" resource and save the data
    Then Aliquot "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | external_release | <original_saved_value> |

    Given the "Aliquot" resource returns the JSON:
      """
      [{
          "Aliquot": {
              "uuid": "11111111-1111-1111-1111-111111111111",
              "external_release": <updated_value>
          }
      }]
      """
    When I connect to the "Aliquot" resource and save the data
    Then Aliquot "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | external_release | <updated_saved_value> |
    Examples:
      | original_value | updated_value | original_saved_value | updated_saved_value |
      | true           | false         | true                 | false               |
      | true           | true          | true                 | true                |
      | false          | false         | false                | false               |
      | false          | true          | false                | true                |
      | true           |               | true                 |                     |
      |                | true          |                      | true                |
      | "true"         | "false"       | true                 | false               |
      | "true"         | "true"        | true                 | true                |
      | "false"        | "false"       | false                | false               |
      | "false"        | "true"        | false                | true                |




      


