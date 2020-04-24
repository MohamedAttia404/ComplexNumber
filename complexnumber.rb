class ComplexNum
    @@add_state=0
    @@multi_state=0
   
    @@bulk_add_state=0
    @@bulk_multi_state=0
    def initialize(real,imagenary)
        @real=real
        @imagenary=imagenary
     
    end    
    def +(other)
        comp=ComplexNum.new(0,0)
        @@add_state=@@add_state+1
        comp.real = @real + other.real
        comp.imagenary = @imagenary + other.imagenary
        return comp
    end
    def *(other)
        @@multi_state=@@multi_state+1
        comp=ComplexNum.new(1,0)
        comp.real=((@real*other.real)-(@imagenary*other.imagenary))
        comp.imagenary=((@real*other.imagenary)+(@imagenary*other.real))
        return comp

    end    
    attr_accessor :real, :imagenary
    def self.bulk_add(args)
        @@bulk_add_state=@@bulk_add_state+1
        comp=ComplexNum.new(0,0)
        args.each do |elem|
            comp.real= comp.real+elem.real
            comp.imagenary=comp.imagenary+elem.imagenary
           
       
        end
       
        return comp    
    end 
    def self.bulk_multi(args)
        comp=ComplexNum.new(1,0)
        @@bulk_multi_state=@@bulk_multi_state+1
        args.each do |elem|
            new_real = comp.real * elem.real - comp.imagenary * elem.imagenary
            comp.imagenary = comp.imagenary * elem.real + comp.real * elem.imagenary
            comp.real = new_real
        

        end 
       
        return comp 
    end
    def self.get_state
        puts "add state :" +@@add_state.to_s
        puts "multi state :" + @@multi_state.to_s
        puts "bulk_multi state :" + @@bulk_multi_state.to_s
        puts "bulk_add state :" + @@bulk_add_state.to_s
    end   
end   
comfirst=ComplexNum.new(2,5) 
comsecond=ComplexNum.new(4,9) 
sum= comfirst + comsecond
puts "#{sum.real}+#{sum.imagenary}i"
multi=comfirst*comsecond
puts "#{multi.real}+#{multi.imagenary}i"
bulkadd=ComplexNum.bulk_add([comsecond])
puts "#{bulkadd.real}+#{bulkadd.imagenary}i"
multibulk=ComplexNum.bulk_multi([comsecond,comfirst])
puts "#{multibulk.real}+#{multibulk.imagenary}i"
ComplexNum.get_state
 