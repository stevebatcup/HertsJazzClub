class Gig < ApplicationRecord
	has_many	:performances
	has_many	:musicians, through: :performances
	belongs_to :season
	belongs_to :pricing_tier

	has_one :child_billing, :foreign_key => :parent_id, class_name: DoubleBill, :dependent => :destroy
  has_one :children, :through => :child_billing, :source => :child, :dependent => :destroy

	has_one :parent_billing, :foreign_key => :child_id, class_name: DoubleBill, :dependent => :destroy
  has_one :parents, :through => :parent_billing, :source => :parent, :dependent => :destroy

	default_scope	{ order(starts: :desc) }

	mount_uploader :image, ImageUploader

	def is_bookable?
		(self.starts >= Date.today) && self.booking_url.present?
	end

	def is_festival?
		self.act.downcase.include?("festival")
	end

	def precis
		"#{self.act} on #{self.starts.strftime("%A %B %e, %Y")}"
	end

	def self.next
		self.unscoped.where("starts >= CURDATE()").order("starts ASC").limit(1).first
	end

	def self.upcoming(amount=3, after='CURDATE()')
		self.unscoped.where("starts > '#{after}'").order("starts").limit(amount)
	end

	def has_passed?
		self.starts < Time.now
	end
end
