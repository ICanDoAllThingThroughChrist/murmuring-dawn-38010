class Role < ApplicationRecord
has_and_belongs_to_many :users, :join_table => :users_roles
enum role_type: {
    "admin"     =>0,
    "visitor"   =>1,
    "user"      =>2
}
end
