def consolidate_cart(cart)
  hash = {}
  
  cart.each do |item|
    item.each_pair do |key, value|
      if !hash[key]
        hash[key] = value
        hash[key][:count] = 1
      else
        hash[key][:count] += 1
      end
    end
  end
  
  hash
end

def apply_coupons(cart, coupons)
  hash = cart.clone
  
  cart.each_pair do |key, value|
    coupons.each do |coupon|
      if coupon[:item] == key
        if cart[key][:count] >= coupon[:num]
          puts hash[key][:count]
          hash[key][:count] -= coupon[:num]
          puts hash[key][:count]
          if hash[key][:count] == 0
            hash.delete(key)
          end
          new_key = key + " W/COUPON"
          new_price = coupon[:cost] / coupon[:num]
          
          hash[new_key] = {}
          hash[new_key][:count] = coupon[:num]
          hash[new_key][:price] = new_price
          hash[new_key][:clearance] = cart[key][:clearance]
        end
      end
    end
  end
  
  hash
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
