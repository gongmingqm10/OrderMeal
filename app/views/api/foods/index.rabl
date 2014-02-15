collection @foods
attributes :name, :describe, :price, :picture
node (:food_id) {|f| f.id.to_s}