class AddMissingInboundEmailTokens < ActiveRecord::Migration
  def change
    User.where(inbound_email_token: nil).find_each do |user|
      user.generate_token(:inbound_email_token)
      user.save
    end
  end
end
