require "pry"
# Returns a new array to that contains elements in the intersection of the two input arrays
# Time complexity: O(n + m ) where n is the larger array and  m is the smaller array, which could just be expressed as O(n).
# Space complexity: O (m) where m is the smaller of the two arrays input into the intersection method. The common elements between the two arrays input are stored in a new array, that could be up to the length of the smaller arrays, m.
def intersection(array1, array2)
  common_elements = [] # O(m) where m is smaller

  if array1 == nil || array2 == nil
    return common_elements
  end

  if array1.length < array2.length
    larger = array2
    smaller = array1
  else
    larger = array1
    smaller = array2
  end

  my_hash = Hash.new() #space complexity is Linear / O(m) where m is the smaller of the 2 input arrays
  smaller.each do |num| # time complexity O(m) where m is smaller array
    my_hash[num] = 1
  end

  larger.each do |num_1| # time complexity is O(n) where n is larger
    if my_hash.include?(num_1) # time complexity is O(1)
      common_elements << num_1
    end
  end
  return common_elements
end

#---------------------------------------------------
# Brute force option
# time complexity: Time complexity is O(n * m) where n is the length of array1 and m is the length of array2, if they are the same length it would be O(n^2) where n is the length of each array. This is the time complexity because this method loops through both array in its entirety.
# space complexity: Linear or O(n) where n is the length of the shorter array. It is linear because the common elements will be stored in a new array
# def intersection(array1, array2)
#   common_elements = []
#   if array1 == nil || array2 == nil
#     return common_elements
#   else
#     array1.each do |num1|
#       array2.each do |num2|
#         if num1 == num2
#           common_elements << num1
#         end
#       end
#     end
#   end
#   return common_elements
# end

# -------------------------------------------------------
# Sorting
# Time complexity: O (m log m) (reduced down from O(m log n) + O (n + log m)) where m is the longer array and n is the shorter array
# space complexity is O(n) where n is the shorter array, since the common elements are held in an array. The array could be as large as the smaller array.

# def intersection(array1, array2)
#   if array1 == nil || array2 == nil
#     return []
#   end

#   if array2.length > array1.length
#     array2.sort! # time complexity is O(n log n)
#     common_elements = search(array1, array2)
#   else
#     array1.sort!
#     common_elements = search(array2, array1)
#   end

#   return common_elements
# end

# def search(shorter, longer)
#   common_elements = [] #linear O(n)
#   shorter.each do |num| # time complexity is O(n) dependent on length on shorter array
#     if binary_search(longer, num)
#       common_elements << num
#     end
#   end
#   return common_elements
# end

# def binary_search(array, value_to_find) # time complexity O(log n)
#   low = 0
#   high = array.length - 1

#   while low <= high
#     mid = (low + high) / 2
#     if array[mid] == value_to_find
#       return true
#     elsif array[mid] > value_to_find #mid too big
#       high = mid - 1
#     else #mid too small
#       low = mid + 1
#     end
#   end
#   return false
# end
