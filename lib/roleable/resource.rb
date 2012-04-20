module Roleable::Resource

  def self.included(base)
    base.has_many :user_roles, :as => :resource
  end
  
  def users_with_role(role_name)
    User.joins(:user_roles).merge(::UserRole.with_role_name(role_name).with_resource(self))
  end
  
end