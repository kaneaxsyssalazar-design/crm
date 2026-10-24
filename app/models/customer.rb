class Customer < ApplicationRecord
  has_one_attached :image

  validates :full_name, presence: true, length: { maximum: 100 }
  validates :phone_number, presence: true,
                           format: { with: /\A[0-9+\-().\s]{7,20}\z/,
                                     message: "must be a valid phone number" }
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP },
                            allow_blank: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id full_name phone_number email_address notes created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end