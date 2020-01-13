def raise_error(msg)
  raise "Seeds: something went wrong! Error: #{msg}"
end

def log(msg)
  puts "Creating #{msg}"
  puts "------------------"
end

%w[Southwark Lambeth].each do |name|
  log(name)
  district = District.create(name: name)
  raise_error(district.errors.full_messages) unless district.valid?
end

%w[SH241AA SH241AB].each do |value|
  log(value)
  postcode = Postcode.create(value: value)
  raise_error(postcode.errors.full_messages) unless postcode.valid?
end
