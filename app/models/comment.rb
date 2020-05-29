class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    validates   :user_id, presence: true
    validates   :content, presence: true
end

# Comment schema
# content   text
# post      reference, null: false
# user      reference, null: false