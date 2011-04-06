@asset_audit
Feature: Update asset_audits

  Scenario: Create a asset_audit then update it
    Given the "AssetAudit" resource returns the JSON:
      """
      [{
          "asset_audit": {
              "created_at": "2010-05-10T09:36:43+00:00",
              "updated_at": "2010-05-27T17:02:11+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "key": "some_key",
							"plate_barcode": "172337",
							"plate_barcode_prefix": "DN",
							"plate_uuid": "22222222-2222-2222-2222-222222222222",
              "created_by": "abc",
              "witnessed_by": "efg",
              "message": "my message",
              "internal_id": 6511
          }
      }]
      """
    When I connect to the "AssetAudit" resource and save the data
    Then AssetAudit "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id          | 6511                                 |
      | key                  | some_key                             |
      | created_by           | abc                                  |
      | message              | my message                           |
      | witnessed_by         | efg                                  |
      | asset_barcode        | 172337                               |
      | asset_barcode_prefix | DN                                   |
      | asset_uuid           | 22222222-2222-2222-2222-222222222222 |
      | last_updated         | 2010-05-27 17:02:11 UTC              |
      | created              | 2010-05-10 09:36:43 UTC              |

    Given the "AssetAudit" resource returns the JSON:
      """
      [{
          "asset_audit": {
              "created_at": "2010-05-10T09:36:43+00:00",
              "updated_at": "2010-05-27T17:02:11+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "key": "some_key",
							"plate_barcode": "123456",
							"plate_barcode_prefix": "DN",
							"plate_uuid": "22222222-2222-2222-2222-222222222222",
							"witnessed_by": "efg",
              "created_by": "efg",
              "message": "another message",
              "internal_id": 6511
          }
      }]
      """
    When I connect to the "AssetAudit" resource and save the data
    Then AssetAudit "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id          | 6511                                 |
      | key                  | some_key                             |
      | created_by           | efg                                  |
      | witnessed_by         | efg                                  |
      | message              | another message                      |
      | asset_barcode        | 123456                               |
      | asset_barcode_prefix | DN                                   |
      | asset_uuid           | 22222222-2222-2222-2222-222222222222 |
      | last_updated         | 2010-05-27 17:02:11 UTC              |
      | created              | 2010-05-10 09:36:43 UTC              |

    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 6511                                                                        |
      | name         |                                                                             |
      | object_name  | asset_audits                                                                |
      | last_updated | 2010-05-27 17:02:11 UTC                                                     |
      | created      | 2010-05-10 09:36:43 UTC                                                     |

