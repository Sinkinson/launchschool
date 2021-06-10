# amend this array so all the names are shortened to just the first three characters

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


flintstones.map! do |name|
  name[0..2]
end

# could also write the line 7 as name[0, 3]
