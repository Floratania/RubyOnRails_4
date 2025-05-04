class ExpensePaymentMethod < ApplicationRecord
  belongs_to :expense
  belongs_to :payment_method


  # validates :expense_id, presence: true
  # validates :payment_method_id, presence: true
end
