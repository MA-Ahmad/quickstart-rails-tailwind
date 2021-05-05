class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :rememberable, :validatable

  def update_password_with_password(params, *options)
    current_password = params.delete(:current_password)
    result = if valid_password?(current_password)
               update(params, *options)
             else
               self.assign_attributes(params, *options)
               self.valid?
               self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               false
             end
    result
  end
end
