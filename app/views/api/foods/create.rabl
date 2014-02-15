object false

child @food => :food do
    node(:id) {|f| f.id.to_s}
    attributes :name, :price, :describe, :pictures
end