class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {candidate: 0, admin: 1, company: 2}



  has_one_attached :picture

  has_many :jobs, foreign_key: :company_id,dependent: :destroy

  has_many :applications, dependent: :destroy

  validate :validate_picture

  private

  def validate_picture
    
    formats = ["image/jpeg", "image/png", "image/webp"]
    if picture.attached? == true &&  formats.include?(picture.blob.content_type)
      errors.add(:picture, "Wrong Format.")
    end
  end

end
