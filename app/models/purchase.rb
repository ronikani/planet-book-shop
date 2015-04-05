require 'rubygems'
require 'active_merchant'

# Use the TrustCommerce test servers
ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
            :login => 'niksa_api1.mail.ru',
            :password => 'MKE5F7HCZ9YYGWR6',
            :signature => 'AFcWxV21C7fd0v3bYYYRCpSSRl31A6lfbJQbwsunQFV9tpp.7Zmbgs-6')

# ActiveMerchant accepts all amounts as Integer values in cents
amount = 1000  # $10.00

# The card verification value is also known as CVV2, CVC2, or CID
credit_card = ActiveMerchant::Billing::CreditCard.new(
                :type               => "visa"
                :first_name         => 'Bob',
                :last_name          => 'Bobsen',
                :number             => '4242424242424242',
                :month              => '8',
                :year               => Time.now.year+1,
                :verification_value => '000')

# Validating the card automatically detects the card type
if credit_card.validate.empty?
  response = gateway.purchase(1000, credit_card, :ip => "127.0.0.1")
  if response.success?
    puts "Successfully complete!"
  else
    puts "Error: #{response.message}"
  end
else
puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('.')}"  
end