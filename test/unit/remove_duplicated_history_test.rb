require 'test_helper'

class RemoveDuplicatedHistoryTest < ActiveSupport::TestCase
  context "Remove duplicated history" do
    context "Where history is a duplicate of current" do 
      setup do
        LibraryTube.create!(:uuid => "1")
        historical_tube = LibraryTube.create!(:uuid => "1")
        historical_tube.update_attributes!(:is_current => false)
      end
    
      should "have 1 current and 1 historical value" do
        assert_equal 2, LibraryTube.count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", false).count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
      end
    
      should "remove historical tube" do
        assert_equal 2, LibraryTube.count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", false).count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
      
        remove_duplicated_history("LibraryTube")
        assert_equal 1, LibraryTube.count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
      end
    end
    
    context "Where history has lots of duplication of current" do 
      setup do
        LibraryTube.create!(:uuid => "1")
        1.upto(5) do
          historical_tube = LibraryTube.create!(:uuid => "1")
          historical_tube.update_attributes!(:is_current => false)
        end
      end
    
      should "remove historical tube" do
        assert_equal 6, LibraryTube.count
        assert_equal 5, LibraryTube.find_all_by_uuid_and_is_current("1", false).count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
      
        remove_duplicated_history("LibraryTube")
        assert_equal 1, LibraryTube.count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
      end
    end
    
    context "Where history has lots of duplication of current and non duplicated history" do 
      setup do
        LibraryTube.create!(:uuid => "1")
        1.upto(2) do
          historical_tube = LibraryTube.create!(:uuid => "1")
          historical_tube.update_attributes!(:is_current => false)
        end
        @historical_tube_with_diffent_name = LibraryTube.create!(:uuid => "1")
        @historical_tube_with_diffent_name.update_attributes!(:is_current => false, :name => "XYZ")
      end
    
      should "remove historical tube" do
        assert_equal 4, LibraryTube.count
        assert_equal 3, LibraryTube.find_all_by_uuid_and_is_current("1", false).count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
      
        remove_duplicated_history("LibraryTube")
        assert_equal 2, LibraryTube.count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
        assert_equal [@historical_tube_with_diffent_name], LibraryTube.find_all_by_uuid_and_is_current("1", false)
      end
    end
    
    context "Where history is not a duplicate of current" do
      setup do
        LibraryTube.create!(:uuid => "1", :name => "ABC")
        historical_tube = LibraryTube.create!(:uuid => "1")
        historical_tube.update_attributes!(:is_current => false, :name => "XYZ")
      end
    
      should "have 1 current and 1 historical value" do
        assert_equal 2, LibraryTube.count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", false).count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
      end
    
      should "not remove historical tube" do
        assert_equal 2, LibraryTube.count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", false).count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
      
        remove_duplicated_history("LibraryTube")
        assert_equal 2, LibraryTube.count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", false).count
        assert_equal 1, LibraryTube.find_all_by_uuid_and_is_current("1", true).count
      end
    end
    
  end
end