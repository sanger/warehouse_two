@billing_event
Feature: Update billing events

  Scenario: Create a billing event then update it
    Given the "BillingEvent" resource returns the JSON:
      """
      [{
          "billing_event": {
              "kind": "charge_internally",
              "price": "3",
              "reference": "R6A222222",
              "created_at": "2010-08-11T11:02:51+00:00",
              "request_uuid": "333333333333333",
              "request_internal_id": 6,
              "quantity": 1,
              "uuid": "11111111-1111-1111-1111-111111111111",
              "project_uuid": "4444444444444444",
              "project_internal_id": 4,
              "updated_at": "2010-08-11T11:02:51+00:00",
              "project_division": "Human variation",
              "created_by": "John Doe",
              "project_name": "Project name",
              "description": "description of project",
              "entry_date": "2010-08-11T11:02:51+00:00",
              "internal_id": 1,
              "project_cost_code": "abcxyz",
              "request_type": "xxxx",
              "library_type": "default"
          }
      }]
      """
    When I connect to the "BillingEvent" resource and save the data
    Then BillingEvent "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id         | 1                       |
      | reference           | R6A222222               |
      | project_internal_id | 4                       |
      | project_uuid        | 4444444444444444        |
      | project_name        | Project name            |
      | division            | Human variation         |
      | created_by          | John Doe                |
      | request_internal_id | 6                       |
      | request_uuid        | 333333333333333         |
      | request_type        | xxxx                    |
      | library_type        | default                 |
      | price               | 3                       |
      | cost_code           | abcxyz                  |
      | quantity            | 1                       |
      | kind                | charge_internally       |
      | description         | description of project  |
      | entry_date          | 2010-08-11 11:02:51 UTC |
      | last_updated        | 2010-08-11 11:02:51 UTC |
      | created             | 2010-08-11 11:02:51 UTC |



    Given the "BillingEvent" resource returns the JSON:
      """
      [{
          "billing_event": {
              "kind": "charge_internally",
              "price": "3",
              "reference": "R111111A222222",
              "created_at": "2010-08-11T11:02:51+00:00",
              "request_uuid": "333333333333333",
              "request_internal_id": 111111,
              "quantity": 1,
              "uuid": "11111111-1111-1111-1111-111111111111",
              "project_uuid": "4444444444444444",
              "project_internal_id": 4,
              "updated_at": "2010-08-11T11:02:51+00:00",
              "project_division": "Another Budget",
              "created_by": "John Doe",
              "project_name": "Project name",
              "description": "description of project",
              "entry_date": "2010-08-11T11:02:51+00:00",
              "internal_id": 1,
              "project_cost_code": "abc123",
              "request_type": "xxxx",
              "library_type": "default"
          }
      }]
      """
    When I connect to the "BillingEvent" resource and save the data
    Then BillingEvent "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id         | 1                       |
      | reference           | R111111A222222          |
      | project_internal_id | 4                       |
      | project_uuid        | 4444444444444444        |
      | project_name        | Project name            |
      | division            | Another Budget          |
      | created_by          | John Doe                |
      | request_internal_id | 111111                  |
      | request_uuid        | 333333333333333         |
      | request_type        | xxxx                    |
      | library_type        | default                 |
      | price               | 3                       |
      | cost_code           | abc123                  |
      | quantity            | 1                       |
      | kind                | charge_internally       |
      | description         | description of project  |
      | entry_date          | 2010-08-11 11:02:51 UTC |
      | last_updated        | 2010-08-11 11:02:51 UTC |
      | created             | 2010-08-11 11:02:51 UTC |

    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 1                                                                             |
      | name         |                                                                               |
      | object_name  | billing_events                                                                |
      | url          | http://localhost:3000/0_5/billing_events/11111111-1111-1111-1111-111111111111 |
      | last_updated | 2010-08-11 11:02:51 UTC                                                       |
      | created      | 2010-08-11 11:02:51 UTC                                                       |


