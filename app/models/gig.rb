class Gig < ApplicationRecord
	has_many	:performances
	has_many	:musicians, through: :performances
	belongs_to :season

	has_one :child_billing, :foreign_key => :parent_id, class_name: DoubleBill, :dependent => :destroy
  has_one :children, :through => :child_billing, :source => :child, :dependent => :destroy

	has_one :parent_billing, :foreign_key => :child_id, class_name: DoubleBill, :dependent => :destroy
  has_one :parents, :through => :parent_billing, :source => :parent, :dependent => :destroy

	mount_uploader :image, ImageUploader

	PRICES_VALUES = {
		'1': {
			standard: 15,
			standard_advanced: 13,
			concessions: 14,
			concessions_advanced: 12,
			members: 12,
			members_advanced: 10
		},
		'2': {
			standard: 18,
			standard_advanced: 16,
			concessions: 17,
			concessions_advanced: 15,
			members: 14,
			members_advanced: 12
		}
	}

	def self.prices(item)
		PRICES_VALUES[item.to_sym]
  end


	def is_bookable?
		(self.starts >= Date.today) && self.booking_url.present?
	end

	def is_festival?
		self.act.downcase.include?("festival")
	end

	def precis
		"#{self.act} on #{self.starts.strftime("%A %B %e, %Y")}"
	end

	def self.upcoming(amount=3)
		self.where("ends >= CURDATE()").order("RAND()").limit(amount)
	end

	def has_passed?
		self.ends < Date.today
	end
end
