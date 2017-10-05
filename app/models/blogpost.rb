class TimeValidator < ActiveModel::Validator
  def validate(record)
    @d = DateTime.now
    #@dn = DateTime.new(@d.year, @d.month, @d.day, @d.hour @d.min + "5",@d.sec)
    if record.date_posted < @d
      record.errors[:base] << "Time must be after current time"
    #else if record.date_posted > @dn
      #record.errors[:base] << "Time must be within 5 minutes after current time"
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
end
