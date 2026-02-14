class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    #アソシエーション　コメント機能
    has_many :comments, dependent: :destroy
    #アソシエーション いいね
    has_many :favorites, dependent: :destroy
    
    #チェック機能
    validates :title, presence: true, length: { maximum: 15 }
    validates :text, presence: true, length: { maximum: 195 }
    validates :image, presence: true

    #enum カラムに番号振るやつ
    enum status: { published: 0, draft: 1 }

    #アソシエーション いいね
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
    #チェック機能

end
