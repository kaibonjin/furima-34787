class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :last_name, presence: true, #/^[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true , #/^[ぁ-んァ-ン一-龥]/
  validates :last_name_kana, presence: true, #/^([ァ-ン]|ー)+$/
  validates :first_name_kana, presence: true, #/^([ァ-ン]|ー)+$/
  validates :birthday, presence: true
end
