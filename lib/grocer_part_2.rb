require_relative './part_1_solution.rb'
require 'pry'
  
  #iterate through cart
  #compare item : value with coupon item 
  #subtract current item count with coupon num 
  #if( count / num ) >= 1  
  # then i modify cart item count to equal (count / num rounded down)  * num 
  #add to cart item with item + discount 

  # REMEMBER: This method **should** update cart

def apply_coupons(cart, coupons)
  copy_item = nil
  original_item_count=0
  text= ' W/COUPON'
  coupon_tot = 0
  
  pp coupons[0][:item]
  # if(coupons.length>1)
  # end 
  
  cart.each do |item|
    coupons.each do |coupon|
      if(item[:item] == coupon[:item] && item[:count] / coupon[:num] >=1)
        original_item_count = item[:count]
        coupuon_tot = (item[:count] / coupon[:num]).floor
        item[:count] = item[:count] - (((item[:count] / coupon[:num]).floor) * coupons[0][:num])
        copy_item = item.clone
        copy_item[:count] = original_item_count - item[:count]
        copy_item[:item] = copy_item[:item] + text
        copy_item[:price] = coupon[:cost] / coupon[:num]
        cart.push(copy_item)
        binding.pry
      end
    end 
  end 
  pp cart

end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end

apply_coupons([{:item => "CHEESE", :price => 6.50, :clearance => false, :count => 4}
], [
      {:item => "AVOCADO", :num => 2, :cost => 5.00},
      {:item => "BEER", :num => 2, :cost => 20.00},
      {:item => "CHEESE", :num => 3, :cost => 15.00}
    ])


