module AssociatedWithRoles
  def self.extended(base)
    base.class_eval do
      include InstanceMethods

      class_attribute :roles
      self.roles = []

      has_role(:manager)
      has_role(:follower)
      has_role(:owner)
      has_role(:administrator)

      user_model = Class.new(ActiveRecord::Base) { include AssociatedWithRoles::User }
      user_model.associated_with(base)
      const_set(:User, user_model)
      after_create :maintain_users, :if => :current?
      
    end
  end

  def has_role(name)
    roles << name.to_s
    define_method("#{name}=") { |users| add_users(name, users) }
  end

  module InstanceMethods
    def users_to_maintain
      @users ||= Hash.new { |h,k| h[k] = [] }
    end
    private :users_to_maintain

    def add_users(role, user_details)
      # self.roles << role
      users_to_maintain[role.to_s].concat(user_details)
    end
    private :add_users

    def users
      self.class::User.owned_by(self)
    end

    def maintain_users
      users.destroy_all

      users.create!(
        users_to_maintain.map do |role,user_details|
          user_details.map do |details|
            details.reverse_merge(:role => role.to_s, :uuid => uuid, :internal_id => internal_id)
          end
        end
      )

      true
    end
    private :maintain_users
  end

  module User
    extend ActiveSupport::Concern

    module ClassMethods
      def associated_with(model)
        association_name = model.name.underscore
        alias_attribute(:uuid, "#{association_name}_uuid")
        alias_attribute(:internal_id, "#{association_name}_internal_id")

        scope :owned_by, lambda { |record| where("#{association_name}_uuid" => record.uuid) }
      end
    end
  end
end
