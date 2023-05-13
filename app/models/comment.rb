class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :tags

  scope :by_post_id, -> (post_id) { where(comments: { post_id: post_id }) if post_id.present? }

  def self.search(params)
    by_post_id(params[:post_id])
      .order('created_at DESC')
  end
end
