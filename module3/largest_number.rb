# Forms the largest number possible by concatenating given numbers.
#
# This function takes an array of digits in string format, and sorts them in such a way that
# concatenating them in that order yields the largest possible number. The sorting is based on string comparison
# where the numbers are first repeated 10 times to ensure proper sorting when concatenated.

def largest_number(a)
  sorted_str_nums = a.sort_by {|num| num * 10}.reverse.join
end

if __FILE__ == $0
  a = STDIN.read.split().drop(1)
  puts largest_number(a)
end