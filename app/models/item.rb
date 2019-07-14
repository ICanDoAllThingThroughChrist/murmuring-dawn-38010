class Item < ApplicationRecord
    attr_accessor :image_cache, :image
    enum frequency: {
        "2018" => 0,
        "2017" => 1,
        "2016" => 2,
        "2015" => 3,
        "2014" => 4,
        "2013" => 5,
        "2012" => 6,
    }
    enum site: {
        "NE Service Center"  => 0,
        "NW Service Center" => 1,
        "SE Service Center" => 2,
        "SW Service Center" => 3,
        "5900 Westpark"     => 4,
    }
    enum task: {
        "Annual Site Inspection-All-SW3P-Members-Wksht-16-X" => 0,
        "Annual Training"                                    => 1,
        "Annual Monitoring-Vendor"                           => 2,
        "Monthly Oil Water Separator Maintenance-Vendor"     => 3,
        "Quarterly Truck Wash-Vendor"                        => 4,
        "Quarterly Periodic Inspection-PM-Wkst-13"           => 5,
        "Quarterly-Visual Monitoring-DAD-FM-Wksht-15"        => 6,
        "Semi-Annual-Benchmark Monitoring-Vendor"            => 7,
        "Weekly-Routine Facility Inspection-DAD-Wksht-7"     => 8,
        "Weekly-Spill response, inventory log-FM-Wksht-8"    => 9,
    }

    # belongs_to :site
    # belongs_to :task
    # belongs_to :frequency
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
    def extension_whitelist
    %w(jpg jpeg gif png pdf)
    end
    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :avatar, content_type:['image/jpeg', 'image/png', 'image/gif', 'application/pdf']
    #validates_attachment_content_type :avatar, content_type: => /\Aimage\/.*\Z/

    before_destroy :ensure_not_referenced_by_any_box_item
        def box_name=(name)
        self.box = Box.find_or_create_by(title: title)
        end

        def box_name
         self.box.name
        end

        # def download_url(style_name=:original)
        #     avatar.s3_bucket.objects[avatar.s3_object(style_name).key].url_for(:read,
        #         :secure => true,
        #         :expires => 24*3600,  # 24 hours
        #         :response_content_disposition => "attachment; filename='#{avatar_file_name}'").to_s
        # end
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
