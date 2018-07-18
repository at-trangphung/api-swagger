class Comment < ApplicationRecord
  belongs_to :article 
  belongs_to :user
  enum status: {waiting: 0, accept: 1, reject: 2}  
end
