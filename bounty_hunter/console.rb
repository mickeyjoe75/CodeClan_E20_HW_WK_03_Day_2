
require('pry')
require_relative('models/bounty')

options_hash = { 'name' => 'hunter1', 'species' => 'species1', 'collected_by' => 'hunter3', 'bounty_value' => '30000' }
bounty1= Bounty.new( options_hash )

options_hash2 = { 'name' => 'hunter2', 'species' => 'species2', 'collected_by' => 'hunter1', 'bounty_value' => '50000' }
bounty2= Bounty.new( options_hash2 )

options_hash3 = { 'name' => 'hunter3', 'species' => 'species3', 'collected_by' => 'hunter5', 'bounty_value' => '80000' }
bounty3= Bounty.new( options_hash3 )


# PizzaOrder.delete_all()

bounty1.save()
bounty2.save()
bounty3.save()

all_bounties = Bounty.all()
p all_bounties
puts ""

first_object = all_bounties.first
first_object.name = "MickeyRourke"
first_object.update()

p Bounty.all()
puts ""

first_object.delete()

puts ""
p Bounty.all()

puts ""
