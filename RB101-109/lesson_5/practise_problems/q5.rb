# figure out the total age of just the male members of the family

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0
munsters.each_value do |details|
  if details["gender"] == "male"
    total_male_age += details["age"]
  end
end

p total_male_age

# we don't need to use the outer hash key which is each family members name,
# we can therefore just use each_value to get access to the inner hash and
# then use the relevant key from there
