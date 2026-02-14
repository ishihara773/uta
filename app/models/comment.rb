class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    #なにか書かないとくれないようにしている
    validates :comment, presence: true, length: { maximum: 35 }
end
