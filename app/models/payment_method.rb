class PaymentMethod < ApplicationRecord

  has_many :expense_payment_methods, dependent: :destroy
  has_many :expenses, through: :expense_payment_methods


  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 50 }
end
