class Product < ActiveRecord::Base
    def self.search(search, search2)
      where("created_at >= ? and created_at <= ? ", Date.parse("#{search}"), Date.parse("#{search2}" ).tomorrow)
    end
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end