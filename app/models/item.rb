class Item < ApplicationRecord
    attr_accessor :image_cache, :image
    #belongs_to :box_item
    has_many :box_items 
    has_many :boxes, through: :box_items
    #mount_uploader :image, ImageUploader
    #validate :image_size
    # This method associates the attribute ":avatar" with a file attachment
    has_attached_file :avatar, styles: {
        thumb: '100x100>',
        square: '200x200#',
        medium: '300x300>'
    }
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    before_destroy :ensure_not_referenced_by_any_box_item
        def box_name=(name)
        self.box = Box.find_or_create_by(title: title)
        end
    
        def box_name
         self.box.name
        end
    
        def download_url(style_name=:original)
            avatar.s3_bucket.objects[avatar.s3_object(style_name).key].url_for(:read,
                :secure => true,
                :expires => 24*3600,  # 24 hours
                :response_content_disposition => "attachment; filename='#{avatar_file_name}'").to_s
        end
    private 
    # def ensure_not_referenced_by_any_box_item
    #     unless :box_items.empty? 
    #         errors.add(:base, 'Box Items present') 
    #         throw :abort 
    #     end 
    # end 

    # def image_size 
    #     if image.size > 5.megabytes 
    #         errors.add(:image, "should be less than 5MB")
    #     end 
    # end
end
