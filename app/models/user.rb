class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def username
      return self.email.split('@')[0].capitalize     
  end

  #validation
  # validates :email, format: { with: Devise.email_regexp }
  # validates_presence_of :email, :state, :country, :phone_number, :gender
  # validates_uniqueness_of :email
  # validates_uniqueness_of :phone_number, numericality: { only_integer: true}, presence: true, length: { is: 9 }

  
  #association
  has_many :achievements
  has_many :announcements
  has_many :comments
  has_many :posts

  #avatar
  has_one_attached :avatar
  
  after_commit :add_default_avatar, on: %i[create update]

  # force size 
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '250x250').processed
    else
      "/default_profile.jpg"
    end
  end

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app','assets','images','default_profile.jpg'
          )
        ), filename: 'default_profile.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end