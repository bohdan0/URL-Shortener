class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :long_url, presence: true, uniqueness: true
  validate :length

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  has_many :taggings,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Tagging

  has_many :topics,
    through: :taggings,
    source: :topic

  def self.random_code
    random_code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: random_code)
      random_code = SecureRandom.urlsafe_base64
    end
    random_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: self.random_code)
  end

  def self.prune(n)
    ShortenedUrl.where("created_at < ?", n.minutes.ago).destroy_all
  end

  def length
    if long_url.length >= 1024
      errors.add(:length, 'too long')
    end
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques(n = 10)
    visits.where("created_at > ?", n.minutes.ago).select(:user_id).distinct.count
  end

  def num_recent_user_clicks(n = 10)
    visits.where("created_at > ?", n.minutes.ago).select(:user_id).count
  end
end
