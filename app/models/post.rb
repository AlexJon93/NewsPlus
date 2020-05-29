class Post < ApplicationRecord
  belongs_to  :user
  has_many    :comments
  validates   :user_id, presence: true
  validates   :content, presence: true
  validates   :title,   presence: true, length: { maximum: 250 }
  validates   :topic,   presence: true, length: { maximum: 60 }

  def self.topics
    ['A.I', 'V.R', 'RMIT', 'Games', 'Rails', 'Go', 'Web', 'M.L.', 'Joke', 'React', 'Vue', 'Node', 'iOS', 'AWS']
  end
end

# Post schema:
# content     text
# title       string
# topic       string
# user        reference, null: false
# views       integer, default: 0