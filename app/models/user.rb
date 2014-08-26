class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, 
           foreign_key: "followed_id", 
           class_name: "Relationship",
           dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower


  has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/

  validates :first_name, :last_name, :birth_date, :gender, :username, presence: true
  validates :username, uniqueness: true
  validates :gender, inclusion: { in: %w(male female other) }

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
end
