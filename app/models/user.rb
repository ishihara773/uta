class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #アソシエーション　コメント
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  #アソシエーション いいね
  has_many :favorites, dependent: :destroy 

  #プロフィール
  has_one_attached :profile_image
  has_one_attached :avatar

  #フォローフォロワー
  has_many :follower, class_name: "Relationship"
  has_many :followed, class_name: "Relationship"
  #外部キー指定
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #取得するデータの定義
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end  
  #エラーメッセージの日本語化
  validates :name, presence: true
end
