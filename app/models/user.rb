class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if nausea && happiness
      nausea > happiness ? 'sad' : 'happy'
    else
      'no mood'
    end
  end
end
