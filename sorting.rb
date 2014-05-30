# quickSort method and partition method for use in the quickSort
def quickSort(list, startIndex, endIndex)
    if startIndex < endIndex
        partitionIndex = partition(list, startIndex, endIndex)
        quickSort(list, startIndex, partitionIndex - 1)
        quickSort(list, partitionIndex + 1, endIndex)
    end
end

def partition(list, startIndex, endIndex)
    pivotNum = list[endIndex]
    i = startIndex - 1

    for j in startIndex..(endIndex - 1)
        if list[j] <= pivotNum
            i += 1
            list[i], list[j] = list[j], list[i]
        end
    end

    list[i + 1], list[endIndex] = list[endIndex], list[i + 1]
    return i + 1
end

# bubbleSort method
def bubbleSort(list)
    for i in 0..(list.length - 1)
      (list.length - i - 1).times do |j|
        if list[j] > list[j + 1]
        list[j], list[j + 1] = list[j + 1], list[j]
        end
      end
    end
end

# rollYourOwnSort method (insertion sort)
def rollYourOwnSort(list)
    for i in 1..(list.length - 1)
      val = list[i]
      j = i - 1

      while j >= 0 && list[j] > val
        list[j + 1] = list[j]
        j -= 1
      end

      list[j + 1] = val
    end
end

# generate the random list
generator = Random.new
quickSortList = []
for i in 1..1000
  randNum = generator.rand(1..10000)
  quickSortList.push(randNum)
end
bubbleSortList = quickSortList.clone
rollYourOwnList = quickSortList.clone
rubySortList = quickSortList.clone

# time for quickSort
startTime = Time.now
quickSort(quickSortList, 0, quickSortList.length-1)
endTime = Time.now
quickSortTime = endTime - startTime

# time for bubbleSort
startTime = Time.now
bubbleSort(bubbleSortList)
endTime = Time.now
bubbleSortTime = endTime - startTime

# time for rollYourOwnSort
startTime = Time.now
rollYourOwnSort(rollYourOwnList)
endTime = Time.now
rollYourOwnSortTime = endTime - startTime

# time for ruby api sort method
startTime = Time.now
rubySortList.sort!
endTime = Time.now
rubySortTime = endTime - startTime

# output for results
puts "\n\n\nquickSorted list:"
p quickSortList
puts "\ntime for quickSort: " + quickSortTime.to_s + " seconds."

puts "\n\n\nbubbleSorted list:"
p bubbleSortList
puts "\ntime for bubbleSort: " + bubbleSortTime.to_s + " seconds."

puts "\n\n\nrollYourOwnSorted list:"
p rollYourOwnList
puts "\ntime for rollYourOwnSort: " + rollYourOwnSortTime.to_s + " seconds."

puts "\n\n\nrubySorted list:"
p rubySortList
puts "\ntime for rubySort: " + rubySortTime.to_s + " seconds."

puts "\n\n\nSummary:"
puts "Time for QuickSort: " + quickSortTime.to_s + " seconds."
puts "Time for BubbleSort: " + bubbleSortTime.to_s + " seconds."
puts "Time for RollYourOwnSort: " + rollYourOwnSortTime.to_s + " seconds."
puts "Time for RubySort: " + rubySortTime.to_s + " seconds."
