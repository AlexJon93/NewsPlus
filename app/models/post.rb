class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title,   presence: true, length: { maximum: 250 }
  validates :topic,   presence: true, length: { maximum: 60 }
end

# Post schema:
# content     text
# title       string
# topic       string
# user        reference, null: false
# views       integer, default: 0