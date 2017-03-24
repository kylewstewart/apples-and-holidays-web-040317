# require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = {holiday_name => supply_array}
end

def all_winter_holiday_supplies(holiday_hash)
  return_array = []
  values = holiday_hash[:winter].values
  values.each do |array|
      i = 0
      while i < array.length
        return_array << array[i]
        i += 1
      end
  end
  return_array
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.keys.each do |key|
    season = key[0].upcase + key[1..-1]
    puts "#{season}:"
    holiday_hash[key].keys.each do |key_1|
      key_2 = key_1.to_s
      holiday = ""
      i = 0
      n = 0
      while i < key_2.length
        if i == 0 || key_2[i-1] == "_"
          holiday = holiday + key_2[i].upcase
        elsif key_2[i] == "_"
          holiday = holiday + " "
        else
          holiday = holiday + key_2[i]
        end
        i += 1
      end
      puts "  #{holiday}: #{holiday_hash[key][key_1].join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  holidays = []
  holiday_hash.keys.each do |key|
    holiday_hash[key].find do |key_1, value|
      holidays.push(key_1) if value.include? "BBQ"
    end
  end
  holidays
end



holiday_hash = {
  winter: {christmas: ["Lights", "Wreath"], new_years: ["Party Hats"]},
  summer: { :fourth_of_july => ["Fireworks", "BBQ"]},
  fall: {thanksgiving: ["Turkey"]},
  spring: {memorial_day: ["BBQ"]}
}

all_holidays_with_bbq(holiday_hash)
