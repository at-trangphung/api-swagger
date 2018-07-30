class UserSerializer < ActiveModel::Serializer
  attributes :email, :password, :password_confirmation, :first_name, 
            :last_name, :address, :phone, :avatar, :company, 
            :address_deliver, :remember_digest
end
