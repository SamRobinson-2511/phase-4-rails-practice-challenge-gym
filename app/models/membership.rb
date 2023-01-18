class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validate :client_only_has_one 

  def client_only_has_one 
    if Membership.find_by( name: self.name, client: self.client, gym: self.gym)
      self.errors.add( :client, "can't have more than one membership")
    end
  end
end
