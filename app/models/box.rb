class Box < ApplicationRecord
    #resourcify
    has_many :box_items, dependent: :destroy
    has_many :items, through: :box_items
    accepts_nested_attributes_for :items#provides items_attributes=(item_attributes) 
    #method in this model
    #member|box = Box|Member.create(params[:member])
    #You can now set or update attributes on the 
    #associated posts|items through an attribute hash for 
    #a member: include the key :posts|items_attributes 
    #with an array of hashes of post|items attributes as a value.
    belongs_to :user 
    belongs_to :order, touch: true
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
    
    def add_item(item_id)
        box_item = self.box_items.find_by(item_id: item_id)
        if box_item 
            box_item.quantity += 1
        else 
            box_item= self.box_items.build(item_ids: item_id)#this line builds association amongs all 3 models(box, box_items, item)
        end 
        box_item 
    end

    def self.boxes_received
        where(received: true)
    end

    def items_attributes=(item_attributes)#a method provided by accepts_nested_attributes_for :item
        #@box = set_box
        boxes= []
        boxes2= []
        boxes3= []
        item_attributes.each_with_index do |key, value|
            if key == "0"##binding.pry
                if value[:title].present?
                    ##binding.pry#self?
                    new_item= Item.find_by(title: value[:title])
                    self.box_items                
                    # #binding.pry
                    if new_item.present?
                        self.box_items.each {|i| 
                            if i.item_id == new_item.id
                            #binding.pry
                                i.quantity +=1
                            end
                                            }
                        #binding.pry
                    elsif new_item.present? == false
                        new_item2= Item.create(title: value[:title])
                        self.box_items.build(item_id: new_item2.id)
                        #binding.pry
                       self.box_items.each {|i| boxes << i.item_id }
                    end
                #binding.pry
                end
            elsif key == "1"
                if value[:title].present?
                    new_item= Item.find_by(title: value[:title])
                    self.box_items
                    if new_item.present?
                        self.box_items.each {|i| 
                            if i.item_id == new_item.id
                            #binding.pry
                                i.quantity +=1
                            end
                                            }
                        #binding.pry
                    elsif new_item.present? == false
                        new_item2= Item.create(title: value[:title])
                        self.box_items.build(item_id: new_item2.id)
                        #binding.pry
                       self.box_items.each {|i| boxes2 << i.item_id }
                    end
                end
            elsif key == "2"
                if value[:title].present?
                    new_item= Item.find_by(title: value[:title])
                    self.box_items
                    if new_item.present?
                        self.box_items.each {|i| 
                            if i.item_id == new_item.id
                            #binding.pry
                                i.quantity +=1
                            end
                                            }
                        #binding.pry
                    elsif new_item.present? == false
                        new_item2= Item.create(title: value[:title])
                        self.box_items.build(item_id: new_item2.id)
                        #binding.pry
                       self.box_items.each {|i| boxes3 << i.item_id }
                    end
                end
            end 
            boxes
            #binding.pry
        end
        ##binding.pry
        boxes
        boxes2
        boxes3
        #binding.pry
    end
end