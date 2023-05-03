class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :memberships

  def memberships
    client = self.object
    memberships = client.memberships.length
    "#{memberships}"
  end
end
