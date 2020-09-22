require_relative 'restricted_array.rb'
# Minitest::Reporters.use!
# Minitest::Reporters::SpecReporter.new

# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: ?
# Space complexity: ?
# no each
def length(array)
  index = 0
  until array[index] == nil
    index += 1
  end
  length = index
  return length
end
#length(RestrictedArray.new(6)) #call method and pass a new array with 6 elements?

# Prints each integer values in the array
# Time complexity: ?
# Space complexity: ?
# call on the length method to print
# wy can't I see this test fail message when rake
def print_array(array)
  # print_array([1,2,3]) => 3 #length - 1
  # print_array([1,2,3]) => print 2
  length = length(array) # how does it know to call on the method above?
  index = 0
  until array[index] == nil # until array[length -1]
    print array[index]#.to_s
    index += 1
  end
  print array[length-1]
end

#print_array(RestrictedArray.new(10))

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?
def search(array, length, value_to_find)
  #where do you want me to use length here? Christopher
  index = 0
  #value_to_find = array[index]# can't assign it it would always find it
  until array[index] == nil

    if array[index] == value_to_find
      return true
    end
    index += 1
  end
  #print length #it lights up
  #p "are you getting here?"
  return false
  #raise NotImplementedError
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted #linear search
# Time complexity: ?
# Space complexity: ?
def find_largest(array, length)
  index = 0
  largest = 0#array[0]#array[index]
  #raise NotImplementedError
  until array[index] == nil
    if   array[index] > largest
      largest =  array[index]
    end
    index += 1
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: ?
# Space complexity: ?
def find_smallest(array, length)
  #raise NotImplementedError
  index = 0
  smallest = array[index]
  #raise NotImplementedError
  until array[index] == nil
    if   array[index] < smallest
      smallest =  array[index]
    end
    index += 1
  end
  return smallest
end
#why is the test expecting the largest number

# Reverses the values in the integer array in place
# Time complexity: ?
# Space complexity: ?
def reverse(array, length)
  #raise NotImplementedError
  index = 0
  index_last = length-1

  until index == index_last || index > index_last#even
    hold = array[index]
    array[index] = array[index_last]
    index += 1
    array[index_last] = hold
    index_last -= 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?
def binary_search(array, length, value_to_find)
  #raise NotImplementedError
  # similar logic to setting up unit tests arrange given this then I will do this code to expect this return
  #if length < 1 you cannot effectively run a binary search
  if length < 1
  exit
  end

  #index = 0
  #mid = length(array)/2 #what about thi approach? replace mid with potential_value
  min =  0            #array[index]
  max = length-1  #array[length-1]

  until min > max #until array[index] == nil?
    potential_value = ((min+max)/2) #first division # mid = ((min+max)/2)

    if array[potential_value] == value_to_find #array[mid] == value_to_find
     return true
    elsif
     array[potential_value] < value_to_find #array[mid] < value_to_find
      min = potential_value + 1 # min = mid +1
    elsif
     array[potential_value] > value_to_find #array[mid] > value_to_find
      max = potential_value - 1 # max = mid -1
    end

  end
  return false #placement
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
