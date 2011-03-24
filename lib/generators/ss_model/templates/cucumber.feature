@<%= singular_name %>
Feature: Update <%= plural_name %>

  Scenario: Create a <%= singular_name %> then update it
    Given the "<%= singular_name.camelize %>" resource returns the JSON:
      """
      [{
          "<%= singular_name %>": {
              "created_at": "2010-05-10T09:36:43+00:00",
              "updated_at": "2010-05-27T17:02:11+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "internal_id": 6511
          }
      }]
      """
    When I connect to the "<%= singular_name.camelize %>" resource and save the data
    Then <%= singular_name.camelize %> "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id   | 6511                                 |
      | last_updated  | 2010-05-27 17:02:11 UTC              |
      | created       | 2010-05-10 09:36:43 UTC              |
    Given the "<%= singular_name.camelize %>" resource returns the JSON:
      """
      [{
          "<%= singular_name %>": {
              "created_at": "2010-05-10T09:36:43+00:00",
              "updated_at": "2011-06-27T17:02:11+00:00",
              "uuid": "11111111-1111-1111-1111-111111111111",
              "id": 6511
          }
      }]
      """
    When I connect to the "<%= singular_name.camelize %>" resource and save the data
    Then <%= singular_name.camelize %> "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id   | 6511                                 |
      | last_updated  | 2011-06-27 17:02:11 UTC              |
      | created       | 2010-05-10 09:36:43 UTC              |
    Then UuidObject "11111111-1111-1111-1111-111111111111" in the warehouse should contain:
      | internal_id  | 6511                                                                    |
      | name         |                                                                         |
      | object_name  | <%= plural_name %>                                                                 |
      | url          | http://localhost:3000/0_5/<%= plural_name %>/11111111-1111-1111-1111-111111111111  |
      | last_updated | 2011-06-27 17:02:11 UTC                                                 |
      | created      | 2010-05-10 09:36:43 UTC                                                 |
