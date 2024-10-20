class Event < ApplicationRecord
  # Association
  belongs_to :owner, class_name: "User"
  has_many :tickets, dependent: :destroy
  has_one_attached :image, dependent: false
  attr_accessor :remove_image

  # Validation
  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :place, length: { maximum: 100 }
    validates :content, length: { maximum: 2000 }
    validates :start_at
    validates :end_at
  end

  validate :start_at_should_be_before_end_at

  # scope
  scope :not_started, -> { where("start_at > ?", Time.zone.now) }
  scope :recent, -> { order("start_at")}

  # method
  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

  before_save :remove_image_if_user_accept

  private

  def start_at_should_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, "は終了時間よりも前に設定してください")
    end
  end

  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)
  end
end
