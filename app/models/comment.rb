class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :reply, optional: true
    belongs_to :reply, optional: true
    validates   :user_id, presence: true
    validates   :post_id, presence: true
    validates   :content, presence: true
end

# Comment schema
# content   text
# post      reference, null: false
# user      reference, null: false
# reply     reference, null: false