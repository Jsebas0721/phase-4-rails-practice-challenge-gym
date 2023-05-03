class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    
    validate :check_membership

    private
    
    def check_membership
        client = Client.find(client_id)
        invalid_client = client.memberships.any? { |member| gym_id == member.gym_id }
        if invalid_client
            errors.add(:client_id, "Client already has a membership with this gym")
        end
    end
end
