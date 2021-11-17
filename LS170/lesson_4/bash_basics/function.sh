greeting () {
  echo Hello $1
  echo Hello $2
}

greeting 'Mike' 'Dave'

# We can also interpolate variables in double-quoted strings
greeting () {
  echo "Hello $1"
  echo "Hello $2"
}
