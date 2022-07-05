function swapName(string) {
  return string.split(' ').reverse().join(', ');
}

swapName('Joe Roberts');    // "Roberts, Joe"
