class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    #なにか書かないとくれないようにしている
    validates :comment,
        presence: { message: "コメントを入力してください"}, 
        length: { maximum: 35 }
end
