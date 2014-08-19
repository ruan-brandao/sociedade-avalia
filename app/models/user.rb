class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  validates :first_name, :last_name, :birth_date, :gender, :username, presence: true
  validates :username, uniqueness: true
  validates :gender, inclusion: { in: %w(male female other) }
end
