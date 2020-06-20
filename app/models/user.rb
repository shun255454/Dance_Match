class User < ApplicationRecord
  has_many :chat_messages
  has_many :chat_room_users
  has_many :reactions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :img_name, ImgNameUploader
  enum sex: { 男: 0, 女: 1 }

  devise :validatable, password_length: 6..128
  validates :name, presence: true
  validates :img_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
end
