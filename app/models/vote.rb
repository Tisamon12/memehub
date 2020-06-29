class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :resource, polymorphic: true

  after_save :change_meme_rate
  after_destroy :restore_meme_rate

  def self.rate(resource_id, resource_type)
  	Vote.where(resource_id: resource_id, resource_type: resource_type, is_upvote: true).count - Vote.where(resource_id: resource_id, resource_type: resource_type, is_upvote: false).count
  end

  private

  	def change_meme_rate
  		if resource_type == "Meme"
  			is_upvote ? resource.rate += 1 : resource.rate -= 1
  			resource.save
  		end
  	end

    def restore_meme_rate
      if resource_type == "Meme"
        is_upvote ? resource.rate -= 1 : resource.rate += 1
        resource.save
      end
    end
end
