# Does the mess_with_demographics method ransack the munsters hash?
# Why or why not?

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# Remember the underlying elements all have object ID's
# so ruby is passing the object ID of each argument to the method.
# If the program had assigned reassigned demo_hash then it wouldn't have been affected
# Because this wasn't done the actual hash was the one that was being messed with
