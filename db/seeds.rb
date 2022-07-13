if Brand.count == 0 and Model.count == 0
  path = File.join(File.dirname(__FILE__), 'models.json')
  records = JSON.parse(File.read(path))
  records.each do |record|
    brand = Brand.find_by_name(record['brand_name'])
    if brand
      Model.create(name:  record['name'], average_price: record['average_price'], brand_id: brand.id)
    else
      new_brand = Brand.create(name: record['brand_name'])
      Model.create(name: record['name'], average_price: record['average_price'], brand_id: new_brand.id)
    end
  end
  puts "Seeded Success"
else
  puts "Data Already Exists"
end
