@plate
Feature: Update Plates

  Scenario: Create a plate then update it
    Given the "Plate" resource returns the JSON:
      """
      [{
          "plate": {
            "created_at": "2011-03-06T19:40:47+00:00",
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "barcode": "1234",
            "barcode_prefix": "AB",
            "plate_size": 96,
            "plate_purpose_name": "Stock Plate",
            "plate_purpose_internal_id": "1",
            "plate_purpose_uuid": "11111111-1111-1111-1111-111111111116",
            "infinium_barcode": "ABC123",
            "location": "Freezer",

            "internal_id": 1
          }
      }]
      """
    When I connect to the "Plate" resource and save the data
    Then Plate "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | created                   | 2011-03-06 19:40:47 UTC              |
      | last_updated              | 2011-03-06 19:40:47 UTC              |
      | uuid                      | 11111111-1111-1111-1111-111111111111 |
      | plate_uuid                | 11111111-1111-1111-1111-111111111333 |
      | barcode                   | 1234                                 |
      | barcode_prefix            | AB                                   |
      | plate_size                | 96                                   |
      | plate_purpose_name        | Stock Plate                          |
      | plate_purpose_internal_id | 1                                    |
      | plate_purpose_uuid        | 11111111-1111-1111-1111-111111111116 |
      | infinium_barcode          | ABC123                               |
      | location                  | Freezer                              |
      | internal_id               | 1                                    |


    Given the "Plate" resource returns the JSON:
      """
      [{
          "plate": {
            "created_at": "2011-03-06T19:40:47+00:00",
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "barcode": "9999",
            "barcode_prefix": "CB",
            "plate_size": 96,
            "plate_purpose_name": "Stock Plate",
            "plate_purpose_internal_id": "1",
            "plate_purpose_uuid": "11111111-1111-1111-1111-111111111116",
            "infinium_barcode": "ABC123",
            "location": "Freezer",

            "internal_id": 1
          }
      }]
      """
    When I connect to the "Plate" resource and save the data
    Then Plate "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
    | created                   | 2011-03-06 19:40:47 UTC              |
    | last_updated              | 2011-03-06 19:40:47 UTC              |
    | uuid                      | 11111111-1111-1111-1111-111111111111 |
    | plate_uuid                | 11111111-1111-1111-1111-111111111333 |
    | barcode                   | 9999                                 |
    | barcode_prefix            | CB                                   |
    | plate_size                | 96                                   |
    | plate_purpose_name        | Stock Plate                          |
    | plate_purpose_internal_id | 1                                    |
    | plate_purpose_uuid        | 11111111-1111-1111-1111-111111111116 |
    | infinium_barcode          | ABC123                               |
    | location                  | Freezer                              |
    | internal_id               | 1                                    |


    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name         | Test plate                                                              |
      | object_name  | plates                                                                  |
      | url          | http://localhost:3000/0_5/plates/11111111-1111-1111-1111-111111111111   |
      | last_updated | 2011-03-06 19:40:47 UTC                                                |
      | created      | 2011-03-06 19:40:47 UTC                                                |
