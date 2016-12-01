class Tagging < ActiveRecord::Base
  validates :topic_id, :shortened_url_id, presence: true
  validate :duplicate

  belongs_to :topic,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :TagTopic

  belongs_to :tagged_url,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl

  def duplicate
    if Tagging.exists?(topic_id: topic_id, shortened_url_id: shortened_url_id)
      errors.add(:duplicate, "already exists")
    end
  end
end
