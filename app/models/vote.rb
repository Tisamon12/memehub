class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :resource, polymorphic: true

  def self.rate(resource_id, resource_type)
  	Vote.where(resource_id: resource_id, resource_type: resource_type, is_upvote: true).count - Vote.where(resource_id: resource_id, resource_type: resource_type, is_upvote: false).count
  end
end
