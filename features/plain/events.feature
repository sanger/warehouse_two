@event
Feature: Update events

  Scenario: Create an event 
    Given the "Event" resource returns the JSON:
      """
      [{
          "event": {
              "created_at": "2007-10-31T17:53:02Z",
              "location": null,
              "updated_at": "2007-10-31T17:53:02Z",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "eventful_internal_id": 3,
              "actioned": null,
              "eventful_type": "Item",
              "created_by": "abc",
              "internal_id": 2,
              "family": "start",
              "descriptor_key": null,
              "content": null,
              "of_interest_to": "efg",
              "identifier": null,
              "message": "ABC"
          }
      }]
      """
    When I connect to the "Event" resource and save the data
    Then Event "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id        | 2                       |
      | source_internal_id | 3                       |
      | source_uuid        |                         |
      | source_type        | Item                    |
      | message            | ABC                     |
      | state              | start                   |
      | identifier         |                         |
      | location           |                         |
      | actioned           |                         |
      | content            |                         |
      | created_by         | abc                     |
      | of_interest_to     | efg                     |
      | descriptor_key     |                         |
      | last_updated       | 2007-10-31 17:53:02 UTC |
      | created            | 2007-10-31 17:53:02 UTC |

    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 2                                                                     |
      | name         |                                                                       |
      | object_name  | events                                                                |
      | last_updated | 2007-10-31 17:53:02 UTC                                               |
      | created      | 2007-10-31 17:53:02 UTC                                               |


