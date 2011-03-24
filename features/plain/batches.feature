@batch
Feature: Update batches

  Scenario: Create a batch then update it
    Given the "Batch" resource returns the JSON:
      """
      [{
          "batch": {
              "created_at": "2010-05-10T09:36:43+00:00",
              "pipeline_name": "my pipeline",
              "pipeline_uuid": "1111",
              "updated_at": "2010-05-27T17:02:11+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "production_state": null,
              "id": 2,
              "created_by": "abc",
              "qc_state": "qc_completed",
              "state": "released",
              "assigned_to": "efg"
          }
      }]
      """
    When I connect to the "Batch" resource and save the data
    Then Batch "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | pipeline_name | my pipeline             |
      | internal_id   | 2                       |
      | created_by    | abc                     |
      | assigned_to   | efg                     |
      | pipeline_name | my pipeline             |
      | pipeline_uuid | 1111                    |
      | state         | released                |
      | qc_state      | qc_completed            |
      | last_updated  | 2010-05-27 17:02:11 UTC |
      | created       | 2010-05-10 09:36:43 UTC |

    Given the "Batch" resource returns the JSON:
      """
      [{
          "batch": {
              "created_at": "2010-05-10T09:36:43+00:00",
              "pipeline_name": "my pipeline",
              "pipeline_uuid": "1111",
              "updated_at": "2010-05-27T17:02:11+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "production_state": null,
              "id": 2,
              "created_by": "abc",
              "qc_state": "failed",
              "state": "pending",
              "assigned_to": "efg"
          }
      }]
      """
    When I connect to the "Batch" resource and save the data
    Then Batch "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | pipeline_name | my pipeline             |
      | internal_id   | 2                       |
      | created_by    | abc                     |
      | assigned_to   | efg                     |
      | pipeline_name | my pipeline             |
      | pipeline_uuid | 1111                    |
      | state         | pending                 |
      | qc_state      | failed                  |
      | last_updated  | 2010-05-27 17:02:11 UTC |
      | created       | 2010-05-10 09:36:43 UTC |

    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 2                                                                      |
      | name         |                                                                        |
      | object_name  | batches                                                                |
      | url          | http://localhost:3000/0_5/batches/11111111-1111-1111-1111-111111111111 |
      | last_updated | 2010-05-27 17:02:11 UTC                                                |
      | created      | 2010-05-10 09:36:43 UTC                                                |


    