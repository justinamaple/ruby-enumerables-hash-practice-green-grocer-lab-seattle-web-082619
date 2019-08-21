def consolidate_cart(cart)
  updated_cart = {}
  
  cart.each do |item|
    item.each_pair do |key, value|
      if !updated_cart[key]
        updated_cart[key] = value
        updated_cart[key][:count] = 1
      else
        updated_cart[key][:count] += 1
      end
    end
  end
  
  updated_cart
end

def apply_coupons(cart, coupons)
  updated_cart = cart.clone
  
  cart.each_pair do |key, value|
    coupons.each do |coupon|
      if coupon[:item] == key
        if cart[key][:count] >= coupon[:num]
          puts updated_cart[key][:count]
          updated_cart[key][:count] -= coupon[:num]
          puts updated_cart[key][:count]
          if updated_cart[key][:count] == 0
            updated_cart.delete(key)
          end
          new_key = key + " W/COUPON"
          new_price = coupon[:cost] / coupon[:num]
          
          updated_cart[new_key] = {}
          updated_cart[new_key][:count] = coupon[:num]
          updated_cart[new_key][:price] = new_price
          updated_cart[new_key][:clearance] = cart[key][:clearance]
        end
      end
    end
  end
  
  updated_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
