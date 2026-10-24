class CustomersController < ApplicationController
  def index
    @customers = Customer.with_attached_image.all
  end

  def alphabetized
    @customers = Customer.with_attached_image.order(:full_name)
  end

  def missing_email
    @customers = Customer.with_attached_image.where(email_address: [nil, ""])
  end
end