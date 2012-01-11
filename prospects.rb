require 'csv'

$my_school = "Palm Beach"

puts "Interest maximum?"
$interest_maximum = gets.strip.to_i

puts "Position?"
$position = gets.strip

$requirements = {}

# Offensive Line
$requirements['OL'] = {
  "Run Block Strength" => 100,
  "Run Block Footwork" => 100,
  "Pass Block Strength" => 75,
  "Pass Block Footwork" => 75,
  "Strength" => 50,
  "Awareness" => 30,
  "Agility" => 25,
  "Weight" => 20,
  "Stamina" => 20
}

# Tight End
$requirements['TE'] = {
  "Catching" => 70,
  "Route Running" => 70,
  "Run Block Strength" => 70,
  "Run Block Footwork" => 70,
  "Pass Block Strength" => 60,
  "Pass Block Footwork" => 60,
  "Impact Blocking" => 55,
  "Strength" => 50,
  "Awareness" => 50,
  "Speed" => 45,
  "Agility" => 45,
  "Height" => 30,
  "Weight" => 15,
  "Stamina" => 20
}

# Quarterback
$requirements['QB'] = {
  "Throw Power" => 80,
  "Throw Accuracy" => 100,
  "Speed" => 60,
  "Carrying" => 50,
  "Break Tackle" => 30,
  "Height" => 15,
  "Injury" => 25,
  "Stamina" => 15
}

# Halfback
$requirements['HB'] = {
  "Speed" => 100,
  "Agility" => 100,
  "Acceleration" => 100,
  "Carrying" => 80,
  "Trucking" => 60,
  "Spin Move" => 40,
  "Juke Move" => 40,
  "Stiff Arm" => 40,
  "Catching" => 20,
  "Stampina" => 20
}

# Fullback
$requirements['FB'] = {
  "Speed" => 60,
  "Agility" => 70,
  "Acceleration" => 60,
  "Carrying" => 70,
  "Strength" => 70,
  "Catching" => 40,
  "Trucking" => 70,
  "Route Running" => 40,
  "Run Block Strength" => 100,
  "Run Block Footwork" => 100,
  "Pass Block Strength" => 85,
  "Pass Block Footwork" => 85,
  "Impact Blocking" => 75,
  "Weight" => 25
}

# Wide Receiver
$requirements['WR'] = {
  "Catching" => 100,
  "Route Running" => 90,
  "Awareness" => 50,
  "Speed" => 120,
  "Agility" => 70,
  "Height" => 30,
  "Catch In Traffic" => 90,
  "Spectacular Catch" => 90,
  "Jumping" => 60,
  "Release" => 60
}

# Defensive Tackle
$requirements['DT'] = {
  "Tackle" => 100,
  "Pursuit" => 80,
  "Block Shedding" => 80,
  "Strength" => 120,
  "Power Moves" => 150,
  "Finesse Moves" => 50,
  "Hit Power" => 60,
  "Speed" => 25,
  "Weight" => 30,
  "Stamina" => 20,
  "Jumping" => 10
}

# Defensive End
$requirements['DE'] = {
  "Tackle" => 100,
  "Pursuit" => 100,
  "Block Shedding" => 100,
  "Strength" => 90,
  "Power Moves" => 50,
  "Finesse Moves" => 150,
  "Hit Power" => 60,
  "Speed" => 50,
  "Weight" => 20,
  "Stamina" => 20
}

# Corner Back
$requirements['CB'] = {
  "Speed" => 150,
  "Acceleration" => 90,
  "Jumping" => 40,
  "Play Recognition" => 80,
  "Man Coverage" => 120,
  "Zone Coverage" => 100,
  "Press" => 70,
  "Height" => 30,
  "Catching" => 40
}

# Free Safty
$requirements['FS'] = {
  "Strength" => 40,
  "Speed" => 100,
  "Acceleration" => 70,
  "Jumping" => 20,
  "Play Recognition" => 150,
  "Awareness" => 130,
  "Zone Coverage" => 140,
  "Catching" => 20,
  "Pursuit" => 80,
  "Block Shedding" => 30,
  "Tackle" => 70
}

# Strong Safety
$requirements['SS'] = {
  "Strength" => 50,
  "Speed" => 50,
  "Play Recognition" => 130,
  "Awareness" => 130,
  "Zone Coverage" => 100,
  "Pursuit" => 100,
  "Block Shedding" => 100,
  "Tackle" => 100,
  "Hit Power" => 80
}

# Outside Linebacker
$requirements['OLB'] = {
  "Strength" => 120,
  "Speed" => 50,
  "Play Recognition" => 80,
  "Awareness" => 80,
  "Zone Coverage" => 60,
  "Power Move" => 50,
  "Finesse Move" => 75, 
  "Pursuit" => 100,
  "Block Shedding" => 140,
  "Tackle" => 100,
  "Hit Power" => 100
}

# Middle Linebacker
$requirements['MLB'] = {
  "Strength" => 120,
  "Speed" => 50,
  "Play Recognition" => 100,
  "Awareness" => 100,
  "Zone Coverage" => 80,
  "Power Move" => 30,
  "Finesse Move" => 45, 
  "Pursuit" => 100,
  "Block Shedding" => 80,
  "Tackle" => 100,
  "Hit Power" => 100
}

data = File.open("prospects.csv", "rb").read
data.gsub!(/([0-9]+)'([0-9]+)"/, '\1!\2')

$prospects = CSV.parse(data, col_sep: ',', quote_char: '"', headers: true)

$prospects = $prospects.each do |row|
  row['Weight'] = row['Weight'][/([0-9]+) lbs/, 1].to_i
  row['Height'] = (row['Height'][/([0-9]+)!([0-9]+)/, 1].to_i * 12) + row['Height'][/([0-9]+)!([0-9]+)/, 2].to_i

  (19..60).each do |column|
    row[column] =
      case row[column]
      when 'A+'
        98
      when 'A'
        95
      when 'A-'
        92
      when 'B+'
        90
      when 'B'
        86
      when 'B-'
        82
      when 'C+'
        78
      when 'C'
        74
      when 'C-'
        70
      when 'D+'
        67
      when 'D'
        63
      when 'D-'
        56
      when 'F'
        50
      when ' '
        nil
      when ''
        nil
      else
        row[column]
      end
  end
end

def interest(p)
  (1..10).each do |i|
    if p["School #{i}"] == $my_school
      return i
    end
  end

  return 100
end

def hidden_attribute_value(p, name)
  begin
    value = case name
      when /Run Block/
        p['Run Block']
      when /Pass Block/
        p['Pass Block']
      when /Route/, /Catch/
        p['Catching'] ? p['Catching'] - 15 : 0
      when "Release"
        p['Acceleration'] ? (p['Acceleration'] + p['Agility'] - 20) / 2 : (p['Speed'] + p['Agility'] - 20) / 2
      when "Jumping"
        60 + ((p['Height'] - 72) * 2)
      when "Elusiveness", "Break Tackle"
        p['Agility']
      when /Move/
        (p['Agility'] + p['Strength'] - 40) / 2
      when "Ball Carrier Vision"
        p['Acceleration']
      when "Hit Power"
        p['Tackle']
      when "Play Recognition"
        p['Awareness']
      else
        0
      end
  rescue
    value = 0
  end

  value ? value + ((p['Caliber'].to_i - 3) * 5) : 0
end

def score(p)
  $requirements[$position].map{|name, weight| (p[name] ? p[name] : hidden_attribute_value(p, name)) * weight}.reduce(:+)
end

def scale(value)
  (value.to_f / $requirements[$position].map{|name, weight| 100 * weight}.reduce(:+)) * 1000
end

def filter_minimum
  $requirements[$position].map{|name, weight| 70 * weight}.reduce(:+)
end

results = {}

$prospects.each do |p|
  if score(p) >= filter_minimum() && (!$interest_maximum || interest(p) <= $interest_maximum)
     results["#{p['Name']} (#{p['Caliber']}* #{p['Position']}, #{p['State']}, #{interest(p)} interest): #{"%d" % scale(score(p))}"] = score(p)
  end
end

results.sort_by{|output, score| score}.each{|output,score| puts output}