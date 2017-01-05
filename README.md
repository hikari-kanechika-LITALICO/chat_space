DB design
====

# table list
* users
* messages
* groups
* group_users

# users
## column
* name :string
* email :text
* password :string
## association
* has_many :messages
* has_many :groups, through: :group_users
* has_many :group_users
## option
* name/ null: false, unique: true
* email/ null: false, unique: true
* password/ null: false

# messages
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
* has_many :messages
* has_many :group_users
## option
* name/ null: false, unique: true

# group_users
## column
* user_id :refernces
* group_id :refernces
## association
* belongs_to :user
* belongs_to :group
## option
* user_id/ foreign_key: true
* group_id/ foreign_key: true
