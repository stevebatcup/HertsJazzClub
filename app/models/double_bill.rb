class DoubleBill < ApplicationRecord
	belongs_to :parent, :class_name => 'Gig'
  belongs_to :child, :class_name => 'Gig'
end
