class Product < ActiveRecord::Base
  belongs_to :author, 	:dependent => :destroy
  belongs_to :category, :dependent => :destroy

  has_many :line_items

  has_many :payments, class_name: :PaypalInstantPaymentNotification

  before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

def paid?
  payments.find_by(status: 'Completed').present?
end


def paypal_url(return_url, cancel_return_url)
  values = {
      cmd: '_xclick',
      charset: 'utf-8',
      business: ‘seller@example.com’,
      return: return_url,
      cancel_return: cancel_return_url,
      item_number: id,
      item_name: title,
      currency_code: 'RUB',
      amount: value
  }





 private
 # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'существуют товарные позиции')
			return false
		end
	end
end

