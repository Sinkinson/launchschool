function countOccurrences(arr) {
  let count = {};

  arr.forEach(string => {
    if (count[string]) {
      count[string] += 1;
    } else {
      count[string] = 1;
    }
  });

  console.log(count);

  for (let key in count) {
    console.log(`${key} => ${count[key]}`);
  }
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
