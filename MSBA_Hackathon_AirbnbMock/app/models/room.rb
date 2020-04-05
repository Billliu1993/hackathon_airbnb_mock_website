class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews

  geocoded_by :address
  after_validation :geocode

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bed, presence: true
  validates :bath_room, presence: true

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "sample_blank.jpg"
    end
  end

  def other_photo1(size)
    if self.photos.length > 0
      self.photos[1].image.url(size)
    else
      "sample_blank.jpg"
    end
  end

  def other_photo2(size)
    if self.photos.length > 0
      self.photos[2].image.url(size)
    else
      "sample_blank.jpg"
    end
  end

end
