class PageContent < ApplicationRecord
	mount_uploader :image, ContentImageUploader
end
