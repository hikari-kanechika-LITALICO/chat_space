DB design
====

# table list
* users
* massages
* groups
* group_users

# users
## column
* name :string
* email :text
* password :string
## association
* has_many :massages
* has_many :groups, through: :group_users
* has_many :group_users
## option
* name/ null: false, unique: true
* email/ null: false, unique: true
* password/ null: false

# massages
## column
* text :text
* image :string
* user_id :refernces
* group_id :refernces
## association
* belongs_to :user
* belongs_to :group
## option
* user_id/ foreign_key: true
* group_id/ foreign_key: true

# groups
## column
* name :string
## association
* has_many :users, through: :group_users
* has_many :massages
* has_many :group_users
## option
* name/ null: false, unique: true
* user_id/ foreign_key: true

# group_users
## column
* user_id :refernces
* group_id :refernces
## association
* belong_to :user
* belong_to :group
## option
* user_id/ foreign_key: true
* group_id/ foreign_key: true
