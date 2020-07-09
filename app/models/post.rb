class Post < ApplicationRecord

    validates :message, presence: true,
                        length: { minimum: 1 }
    belongs_to :user
    validates :user_id, presence: true
    validates :message, presence: true

end
