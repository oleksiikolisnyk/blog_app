class Post < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  has_many :comments
  has_and_belongs_to_many :tags

  scope :by_title,   -> (title) { where("posts.title ILIKE concat('%',?,'%')", title) if title.present? }
  scope :by_user_id, -> (user_id) { where(posts: { user_id: user_id }) if user_id.present? }
  scope :by_blog_id, -> (blog_id) { where(posts: { blog_id: blog_id }) if blog_id.present? }
  scope :by_tag, -> (tag) { includes(:tags).where(tags: { title: tag }) if tag.present? }

  def self.search(params)
    # also I would add search of title if the umber of symbols more than 3 to decrease the size response
    # sort_by_tag is not completed
    by_title(params[:title])
      .by_blog_id(params[:blog_id])
      .by_user_id(params[:user_id])
      .order('created_at DESC')
  end
end
