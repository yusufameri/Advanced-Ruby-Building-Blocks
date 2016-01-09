def swap arr, ind1, ind2
	arr[ind1], arr[ind2] = arr[ind2], arr[ind1]
	arr
end

def bubble_sort items
	n = items.length
	swaped = true
	while swaped do
		swaped = false
    for i in (1..n-1)
    	if items[i-1] > items[i]
    		items = swap items, i-1, i
    		swaped = true
    	end # end if
    end# end for
    n-=1
  end #end until
  items
end # end method
puts "bubble_sort: "
puts bubble_sort [4,5,3,8,4,1,4]
# puts bubble_sort [1,2,3]
# puts swap [1,5,3,7,4,2],2,5


def bubble_sort_by items
	n = items.length
	swaped = true
	while swaped do
		swaped = false
    for i in (1..n-1)
    	if yield(items[i], items[i-1])
    		items = swap items, i-1, i
    		swaped = true
    	end # end if
    end# end for
    n-=1
  end #end until
  items
end # end method
puts "bubble_sort_by: "
puts bubble_sort_by [4,5,3,8,4,1,4] {|first, second| first < second}