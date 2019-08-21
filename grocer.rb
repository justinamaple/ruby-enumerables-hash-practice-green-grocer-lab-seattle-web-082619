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

def get_new_key(key)
  key + " W/COUPON"
end

def get_new_price(coupon)
  coupon[:cost] / coupon[:num]
end

def apply_coupons(cart, coupons)
  updated_cart = cart.clone
  
  cart.each_pair do |key, value|
    coupons.each do |coupon|
      if coupon[:item] == key
        if updated_cart[key][:count] >= coupon[:num]
          updated_cart[key][:count] -= coupon[:num]
          
          new_key = get_new_key(key)
          new_price = get_new_price(coupon)
          clearance = updated_cart[key][:clearance]
          
          if !updated_cart[new_key]
            updated_cart[new_key] = create_new_item(new_key, new_price, clearance)
          end
      
          updated_cart[new_key][:count] += coupon[:num]
        end
      end
    end
  end
  
  updated_cart
end

def create_new_item(new_key, new_price, clearance)
  { :count => 0, :price => new_price, :clearance => clearance }
end

def apply_clearance(cart)
  cart.map do |key, value|
    p key
    p value
    if(cart[key][:clearance])
      item[:price] = (item[:price] * 0.8).round(2)
    end
  end
end

def checkout(cart, coupons)
  # code here
end
