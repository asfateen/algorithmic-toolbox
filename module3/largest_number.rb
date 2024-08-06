def largest_number(a)
  sorted_str_nums = a.sort_by {|num| num * 10}.reverse.join
end

if __FILE__ == $0
  a = STDIN.read.split().drop(1)
  puts largest_number(a)
end