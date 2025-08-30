class Job < ApplicationRecord

  belongs_to :company, class_name: "User"

  has_many_attached :documents

  has_many :applications, dependent: :destroy

  validates :title, :description, :location, presence: true


end
