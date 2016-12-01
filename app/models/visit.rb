class Visit < ActiveRecord::Base
  validates :user_id, :shortened_url_id, presence: true
  validate :creation_limit

  belongs_to :visitor,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :visited_url,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl

  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: user.id, shortened_url_id: shortened_url.id)
  end

  def creation_limit
    unless User.find(user_id).premium
      errors.add(:robot, 'detected') if ShortenedUrl.find(shortened_url_id).num_recent_user_clicks(1) >= 5
    end
  end
end
