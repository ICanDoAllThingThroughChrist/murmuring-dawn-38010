class Cart
        def initialize(w)
            @w = w
        end
        def search(w)
            if (1..10).include?(w)
            puts "1 to 10"
            elsif (11..20).include?(w)
            puts "11 to 20" 
            end
        end
 end
