class Application < ApplicationRecord
  has_one_attached :resume
  has_one_attached :cover_letter

  validates :resume, presence: :true

  belongs_to :user 
  belongs_to :job

  validate :validate_attachment


  private

  def validate_attachment

    formats = ["application/pdf"]
    if resume.attached? == true &&  formats.include?(resume.blob.content_type) == false
      errors.add(:resume, "Wrong format")
    end

    if cover_letter.attached? == true && formats.include?(cover_letter.blob.content_type) == false
      errors.add(:cover_letter, "Wrong format")
    end

  end

end
