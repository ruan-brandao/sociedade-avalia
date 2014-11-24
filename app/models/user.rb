class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :post_likes
  has_many :political_party_likes

  belongs_to :political_party

  #Relationships associations (following) 
  has_many :relationships, 
            foreign_key: "follower_id", 
            dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, 
           foreign_key: "followed_id", 
           class_name: "Relationship",
           dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  #PoliticianLikes associations
  has_many :politician_likes,
            foreign_key: "liker_id",
            dependent: :destroy
  has_many :likes_given, through: :politician_likes, source: :liked

  has_many :politician_likes_received,
            foreign_key: "liked_id",
            class_name: "PoliticianLikes",
            dependent: :destroy
  has_many :likes_received, through: :false_politician_likes, source: :liker

  #Paperclip Image validations
  has_attached_file :profile_picture, 
                    :styles => { :medium => "300x300>", 
                    :thumb => "100x100>" }, 
                    :default_url => "/assets/:style/missing.png"
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :profile_picture, less_than: 1.megabytes

  validates :first_name, :last_name, :birth_date, :gender, :username, presence: true
  validates :username, uniqueness: true
  validates :gender, inclusion: { in: %w(male female other) }
  validates :state, inclusion: { in: %w(AC AL AP AM BA CE DF ES GO 
                                        MA MT MS MG PA PB PR PE PI
                                        RJ RN RS RO RR SC SP SE TO) }, allow_nil:true

  def full_name
  	"#{self.first_name} #{self.last_name}"
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def feed
    Post.from_users_followed_by(self)
  end

  def has_liked_post?(post)
    return false if PostLike.where(user_id: self.id, post_id: post).empty?
    true
  end

  def has_liked_political_party?(political_party)
    return false if PoliticalPartyLike.where(user_id: self.id, political_party_id: political_party).empty?
    true
  end

  def has_liked_politician?(politician)
    return false if PoliticianLike.where(liker_id: self.id, liked_id: politician).empty?
    true
  end

  def total_likes_and_dislikes
    PoliticianLike.where(liked_id: self.id).count
  end

  def likes
    PoliticianLike.where(liked_id: self.id, value: true).count
  end

  def dislikes
    PoliticianLike.where(liked_id: self.id, value: false).count
  end

  def like_dislike_proportion
    self.likes.to_f / self.dislikes.to_f
  end
end
