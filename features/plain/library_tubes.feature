@library_tube
Feature: Update library_tubes

  Scenario: Create a library_tube then update it
    Given the "LibraryTube" resource returns the JSON:
      """
      [{
          "library_tube": {
              "created_at": "2010-05-27T17:02:11+00:00",
              "updated_at": "2010-05-27T17:02:11+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "name": "Tube 1234",
              "barcode": "1234",
              "barcode_prefix": "AB",
              "qc_state": "pending",
              "closed": true,
              "concentration": 6.3,
              "volume": 3.5,
              "two_dimensional_barcode": "1234",
              "scanned_in_date": "2010-05-27T17:02:11+00:00",
              "public_name": "ABCD",
              "id": 10
          }
      }]
      """
    When I connect to the "LibraryTube" resource and save the data
    Then LibraryTube "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id             | 10                      |
      | name                    | Tube 1234               |
      | barcode                 | 1234                    |
      | barcode_prefix          | AB                      |
      | state                   | pending                 |
      | closed                  | true                    |
      | concentration           | 6.3                     |
      | volume                  | 3.5                     |
      | two_dimensional_barcode | 1234                    |
      | public_name             | ABCD                    |
      | scanned_in_date         | 2010-05-27 17:02:11 UTC |
      | last_updated            | 2010-05-27 17:02:11 UTC |
      | created                 | 2010-05-27 17:02:11 UTC |

    Given the "LibraryTube" resource returns the JSON:
      """
      [{
          "library_tube": {
            "created_at": "2010-05-27T17:02:11+00:00",
            "updated_at": "2010-05-27T17:02:11+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "name": "Tube 1234",
            "barcode": "5678",
            "barcode_prefix": "AB",
            "qc_state": "started",
            "closed": false,
            "concentration": 6.3,
            "volume": 3.5,
            "two_dimensional_barcode": "1234",
            "public_name": "ABCD",
            "scanned_in_date": "2010-05-27T17:02:11+00:00",
            "id": 10
          }
      }]
      """
    When I connect to the "LibraryTube" resource and save the data
    Then LibraryTube "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id             | 10                      |
      | name                    | Tube 1234               |
      | barcode                 | 5678                    |
      | barcode_prefix          | AB                      |
      | state                   | started                 |
      | closed                  | false                   |
      | concentration           | 6.3                     |
      | volume                  | 3.5                     |
      | two_dimensional_barcode | 1234                    |
      | public_name             | ABCD                    |
      | scanned_in_date         | 2010-05-27 17:02:11 UTC |
      | last_updated            | 2010-05-27 17:02:11 UTC |
      | created                 | 2010-05-27 17:02:11 UTC |
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 10                      |
      | name         | Tube 1234               |
      | object_name  | library_tubes           |
      | last_updated | 2010-05-27 17:02:11 UTC |
      | created      | 2010-05-27 17:02:11 UTC |
