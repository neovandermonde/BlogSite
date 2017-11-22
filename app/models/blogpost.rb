class TimeValidator < ActiveModel::Validator
  def validate(record)
    @d = DateTime.now
    @dn = @d + Rational('0.05')
    if record.date_posted < @d
      record.errors[:base] << "Time must be after current time"
    else if record.date_posted > @dn
      record.errors[:base] << "Time must be within 1 hours of current time"
      end
    end
  end
end


class Blogpost < ActiveRecord::Base
  validates_with TimeValidator

  validates :title, :blog, :creator, presence: true

  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png|jpeg)\Z}i,
    message: 'must be a URL for GIF, JPG, JPEG or PNG image.'
  }
  
  has_many :comments
end
