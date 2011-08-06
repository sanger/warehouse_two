@well
Feature: Update Wells

  Scenario: Create a well then update it (a second update shouldn't change create a new record)
    Given the "Well" resource returns the JSON:
      """
      [{
          "well": {
            "name": "Test well",
            "sample_internal_id": 2,
            "created_at": "2011-03-06T19:40:47+00:00",
            "pico_pass": "ungraded",
            "requested_volume": null,
            "gel_pass": null,
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "current_volume": null,
            "concentration": null,
            "sample_name": "ABC123",
            "picked_volume": null,
            "buffer_volume": null,
            "plate_barcode": "22409",
            "map": "F2",
            "plate_barcode_prefix": "DN",
            "sample_uuid": "11111111-1111-1111-1111-111111111222",
            "plate_uuid": "11111111-1111-1111-1111-111111111333",
            "measured_volume": 3.2,
            "sequenom_count": 30, 
            "gender_markers": "MFF",
            "genotyping_status": "awaiting",
            "genotyping_snp_plate_id": "9876",
            
            "internal_id": 1
          }
      }]
      """
    When I connect to the "Well" resource and save the data
    Then Well "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name                    | Test well                            |
      | sample_internal_id      | 2                                    |
      | created                 | 2011-03-06 19:40:47 UTC              |
      | pico_pass               | ungraded                             |
      | requested_volume        |                                      |
      | gel_pass                |                                      |
      | last_updated            | 2011-03-06 19:40:47 UTC              |
      | uuid                    | 11111111-1111-1111-1111-111111111111 |
      | current_volume          |                                      |
      | concentration           |                                      |
      | sample_name             | ABC123                               |
      | picked_volume           |                                      |
      | buffer_volume           |                                      |
      | plate_barcode           | 22409                                |
      | map                     | F2                                   |
      | measured_volume         | 3.2                                  |
      | sequenom_count          | 30                                   |
      | gender_markers          | MFF                                  |
      | plate_barcode_prefix    | DN                                   |
      | sample_uuid             | 11111111-1111-1111-1111-111111111222 |
      | plate_uuid              | 11111111-1111-1111-1111-111111111333 |
      | genotyping_status       | awaiting                             |
      | genotyping_snp_plate_id | 9876                                 |
      | internal_id             | 1                                    |

    Given the "Well" resource returns the JSON:
      """
      [{
          "well": {
            "name": "Test well",
            "sample_internal_id": 2,
            "created_at": "2011-03-06T19:40:47+00:00",
            "pico_pass": "passed",
            "requested_volume": null,
            "gel_pass": null,
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "current_volume": null,
            "concentration": null,
            "sample_name": "ABC123",
            "picked_volume": null,
            "buffer_volume": null,
            "plate_barcode": "22409",
            "map": "F2",
            "plate_barcode_prefix": "DN",
            "sample_uuid": "11111111-1111-1111-1111-111111111222",
            "plate_uuid": "11111111-1111-1111-1111-111111111333",
            "measured_volume": 3.4,
            "sequenom_count": 30, 
            "gender_markers": "MFF",
            "genotyping_status": "done",
            "genotyping_snp_plate_id": "9876",
            
            "internal_id": 1
          }
      }]
      """
    When I connect to the "Well" resource and save the data
    Then Well "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name                    | Test well                            |
      | sample_internal_id      | 2                                    |
      | created                 | 2011-03-06 19:40:47 UTC              |
      | pico_pass               | passed                               |
      | requested_volume        |                                      |
      | gel_pass                |                                      |
      | last_updated            | 2011-03-06 19:40:47 UTC              |
      | uuid                    | 11111111-1111-1111-1111-111111111111 |
      | current_volume          |                                      |
      | concentration           |                                      |
      | sample_name             | ABC123                               |
      | picked_volume           |                                      |
      | buffer_volume           |                                      |
      | plate_barcode           | 22409                                |
      | map                     | F2                                   |
      | measured_volume         | 3.4                                  |
      | sequenom_count          | 30                                   |
      | gender_markers          | MFF                                  |
      | plate_barcode_prefix    | DN                                   |
      | sample_uuid             | 11111111-1111-1111-1111-111111111222 |
      | plate_uuid              | 11111111-1111-1111-1111-111111111333 |
      | genotyping_status       | done                                 |
      | genotyping_snp_plate_id | 9876                                 |
      | internal_id             | 1                                    |
    
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name         | Test well               |
      | object_name  | wells                   |
      | last_updated | 2011-03-06 19:40:47 UTC |
      | created      | 2011-03-06 19:40:47 UTC |

    Given the "Well" resource returns the JSON:
      """
      [{
          "well": {
            "name": "Test well",
            "sample_internal_id": 2,
            "created_at": "2011-03-06T19:40:47+00:00",
            "pico_pass": "passed",
            "requested_volume": null,
            "gel_pass": null,
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "current_volume": null,
            "concentration": null,
            "sample_name": "ABC123",
            "picked_volume": null,
            "buffer_volume": null,
            "plate_barcode": "22409",
            "map": "F2",
            "plate_barcode_prefix": "DN",
            "sample_uuid": "11111111-1111-1111-1111-111111111222",
            "plate_uuid": "11111111-1111-1111-1111-111111111333",
            "measured_volume": 3.4,
            "sequenom_count": 30, 
            "gender_markers": "MFF",
            "genotyping_status": "done",
            "genotyping_snp_plate_id": "9876",
            
            "internal_id": 1
          }
      }]
      """
    When I connect to the "Well" resource and save the data
    Then Well "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name                    | Test well                            |
      | sample_internal_id      | 2                                    |
      | created                 | 2011-03-06 19:40:47 UTC              |
      | pico_pass               | passed                               |
      | requested_volume        |                                      |
      | gel_pass                |                                      |
      | last_updated            | 2011-03-06 19:40:47 UTC              |
      | uuid                    | 11111111-1111-1111-1111-111111111111 |
      | current_volume          |                                      |
      | concentration           |                                      |
      | sample_name             | ABC123                               |
      | picked_volume           |                                      |
      | buffer_volume           |                                      |
      | plate_barcode           | 22409                                |
      | map                     | F2                                   |
      | measured_volume         | 3.4                                  |
      | sequenom_count          | 30                                   |
      | gender_markers          | MFF                                  |
      | plate_barcode_prefix    | DN                                   |
      | sample_uuid             | 11111111-1111-1111-1111-111111111222 |
      | plate_uuid              | 11111111-1111-1111-1111-111111111333 |
      | genotyping_status       | done                                 |
      | genotyping_snp_plate_id | 9876                                 |
      | internal_id             | 1                                    |
    
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name         | Test well               |
      | object_name  | wells                   |
      | last_updated | 2011-03-06 19:40:47 UTC |
      | created      | 2011-03-06 19:40:47 UTC |

