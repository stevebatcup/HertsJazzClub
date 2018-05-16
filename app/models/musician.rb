class Musician < ApplicationRecord
	has_and_belongs_to_many	:instruments
	validates :last_name, uniqueness: { scope: [:first_name], message: ->(object, data) do
			"#{data[:value]} alredy exists with First Name #{object.first_name}. Looks like this musician has alread been added!"
		end
	}

	def full_name
		"#{first_name} #{last_name}"
	end
end
