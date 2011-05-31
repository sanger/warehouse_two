@duplicate_is_current
Feature: Clean up duplicate current rows
  
  Scenario:
    Given I have a current "Well" with UUID "11111111-1111-1111-1111-111111111111"
    And I have a current "Well" with UUID "11111111-1111-1111-1111-111111111111"
    Then there should be 2 current rows for UUID "11111111-1111-1111-1111-111111111111" in the Well table
    Given the "Well" resource returns the JSON:
       """
       [{
           "well": {
             "name": "Test well",
             "created_at": "2011-03-06T19:40:47+00:00",
             "updated_at": "2011-03-06T19:40:47+00:00",
             "uuid": "11111111-1111-1111-1111-111111111111",
             "internal_id": 1
           }
       }]
       """
    When I connect to the "Well" resource and save the data
    Then there should be 1 current row for UUID "11111111-1111-1111-1111-111111111111" in the Well table
     