@sample @update @delete
Feature: Check a local object to see if its been remotely updated or deleted
 
  Background:
    Given all of this is happening at exactly "14-Mar-2011 10:00:00+00:00"

  Scenario: A resource has been remotely deleted
    Given the "Sample" resource returns the JSON:
      """
      [{
          "sample": {
            "name": "Test sample",
            "created_at": "2011-03-06T19:40:47+00:00",
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
 
            "id": 1
          }
      }]
      """
    When I connect to the "Sample" resource and save the data
    Then Sample "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name         | Test sample                          |
      | created      | 2011-03-06 19:40:47 UTC              |
      | last_updated | 2011-03-06 19:40:47 UTC              |
      | uuid         | 11111111-1111-1111-1111-111111111111 |
      | internal_id  | 1                                    |
      | is_current   | true                                 |
      | checked_at   | 2011-03-14 10:00:00 UTC              |
  
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 1                       |
      | name         | Test sample             |
      | object_name  | samples                 |
      | last_updated | 2011-03-06 19:40:47 UTC |
      | created      | 2011-03-06 19:40:47 UTC |
      | deleted      |                         |
      | checked_at   | 2011-03-14 10:00:00 UTC |

    Given the remote "Sample" with UUID "11111111-1111-1111-1111-111111111111" has been deleted
    Given all of this is happening at exactly "15-Mar-2011 20:00:00+00:00"
    
    When I sync the remote object with UUID "11111111-1111-1111-1111-111111111111"
    Then Sample "11111111-1111-1111-1111-111111111111" in the warehouse with history should contain:
      | name             | Test sample                          |
      | created          | 2011-03-06 19:40:47 UTC              |
      | last_updated     | 2011-03-06 19:40:47 UTC              |
      | uuid             | 11111111-1111-1111-1111-111111111111 |
      | internal_id      | 1                                    |
      | is_current       | false                                |
      | checked_at       | 2011-03-15 20:00:00 UTC              |
  
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 1                       |
      | name         | Test sample             |
      | object_name  | samples                 |
      | last_updated | 2011-03-06 19:40:47 UTC |
      | created      | 2011-03-06 19:40:47 UTC |
      | deleted      | true                    |
      | checked_at   | 2011-03-15 20:00:00 UTC |

  
  Scenario: A resource has been remotely updated
    Given the "Sample" resource returns the JSON:
      """
      [{
          "sample": {
            "name": "Test sample",
            "created_at": "2011-03-06T19:40:47+00:00",
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
   
            "id": 1
          }
      }]
      """
    When I connect to the "Sample" resource and save the data
    Then Sample "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name         | Test sample                          |
      | created      | 2011-03-06 19:40:47 UTC              |
      | last_updated | 2011-03-06 19:40:47 UTC              |
      | uuid         | 11111111-1111-1111-1111-111111111111 |
      | internal_id  | 1                                    |
      | is_current   | true                                 |
      | checked_at   | 2011-03-14 10:00:00 UTC              |
    
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 1                       |
      | name         | Test sample             |
      | object_name  | samples                 |
      | last_updated | 2011-03-06 19:40:47 UTC |
      | created      | 2011-03-06 19:40:47 UTC |
      | deleted      |                         |
      | checked_at   | 2011-03-14 10:00:00 UTC |

    Given the remote "Sample" with UUID "11111111-1111-1111-1111-111111111111" returns this JSON:
      """
      {
          "sample": {
            "name": "Test sample",
            "created_at": "2011-03-06T19:40:47+00:00",
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
            "sanger_sample_id": "ABC_123",
   
            "id": 1
          }
      }
      """
    Given all of this is happening at exactly "15-Mar-2011 20:00:00+00:00"
    When I sync the remote object with UUID "11111111-1111-1111-1111-111111111111"
    Then Sample "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name             | Test sample                          |
      | created          | 2011-03-06 19:40:47 UTC              |
      | last_updated     | 2011-03-06 19:40:47 UTC              |
      | uuid             | 11111111-1111-1111-1111-111111111111 |
      | sanger_sample_id | ABC_123                              |
      | internal_id      | 1                                    |
      | is_current       | true                                 |
      | checked_at       | 2011-03-15 20:00:00 UTC              |
    
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 1                       |
      | name         | Test sample             |
      | object_name  | samples                 |
      | last_updated | 2011-03-06 19:40:47 UTC |
      | created      | 2011-03-06 19:40:47 UTC |
      | deleted      |                         |
      | checked_at   | 2011-03-15 20:00:00 UTC |

  
  Scenario: A resource hasnt changed
    Given the "Sample" resource returns the JSON:
      """
      [{
          "sample": {
            "name": "Test sample",
            "created_at": "2011-03-06T19:40:47+00:00",
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
     
            "id": 1
          }
      }]
      """
    When I connect to the "Sample" resource and save the data
    Then Sample "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name         | Test sample                          |
      | created      | 2011-03-06 19:40:47 UTC              |
      | last_updated | 2011-03-06 19:40:47 UTC              |
      | uuid         | 11111111-1111-1111-1111-111111111111 |
      | internal_id  | 1                                    |
      | is_current   | true                                 |
      | checked_at   | 2011-03-14 10:00:00 UTC              |
      
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 1                       |
      | name         | Test sample             |
      | object_name  | samples                 |
      | last_updated | 2011-03-06 19:40:47 UTC |
      | created      | 2011-03-06 19:40:47 UTC |
      | deleted      |                         |
      | checked_at   | 2011-03-14 10:00:00 UTC |

    Given the remote "Sample" with UUID "11111111-1111-1111-1111-111111111111" returns this JSON:
      """
      {
          "sample": {
            "name": "Test sample",
            "created_at": "2011-03-06T19:40:47+00:00",
            "updated_at": "2011-03-06T19:40:47+00:00",
            "uuid": "11111111-1111-1111-1111-111111111111",
     
            "id": 1
          }
      }
      """
    Given all of this is happening at exactly "15-Mar-2011 20:00:00+00:00"
    When I sync the remote object with UUID "11111111-1111-1111-1111-111111111111"
    Then Sample "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | name         | Test sample                          |
      | created      | 2011-03-06 19:40:47 UTC              |
      | last_updated | 2011-03-06 19:40:47 UTC              |
      | uuid         | 11111111-1111-1111-1111-111111111111 |
      | internal_id  | 1                                    |
      | is_current   | true                                 |
      | checked_at   | 2011-03-15 20:00:00 UTC              |
      
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 1                       |
      | name         | Test sample             |
      | object_name  | samples                 |
      | last_updated | 2011-03-06 19:40:47 UTC |
      | created      | 2011-03-06 19:40:47 UTC |
      | deleted      |                         |
      | checked_at   | 2011-03-15 20:00:00 UTC |

   
  
  
