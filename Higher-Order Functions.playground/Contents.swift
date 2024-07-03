import UIKit

// map
let numbers = [1,2,3,4,5]
let doubled = numbers.map { $0 * 2 }
print(doubled)

// compactMap
let strings = ["1","2","3","4","5"]
let numbers1 = strings.compactMap { Int($0) }
print(numbers1)

//forEach
let words = ["apple", "banana", "cherry"]
words.forEach { print($0) }

// forEach
var counter = 0
let numbers2 = [1,2,3,4,5,6]
numbers2.forEach { number in
    if number % 2 == 0 {
        counter = counter+1
    }
}
print(counter)

// filter
let numbers3 = [1,2,3,4,5,6,7,8]
let filteredNumbers = numbers3.filter { $0 % 2 == 0}
print(filteredNumbers)

//filter and map
let numbers4 = [1,2,3,4,5,6,7,8,9,10]
let newNumbers = numbers4.filter { $0 % 2 == 0 }.map { $0 * $0 }
print(newNumbers)


// sorted
let numbers5 = [5,6,2,1,3,4]
let sortedNumbers = numbers5.sorted { $0 > $1}
print(sortedNumbers)

// reduce
let numbers6 = [1,2,3,4,5]
let sum = numbers6.reduce(0) { $0 + $1}
print(sum)

let words1 = ["apple", "banana", "cherry"]
let totalWords = words.reduce("", { $0 + " " + $1})
print(totalWords)

for i in stride(from:1, to:10, by:1)
{
    print(i)
}

func factorial(of number: Int) -> Int {
    if number == 0 {
        return 1
    }
    return number * factorial(of: number - 1)
}
print(factorial(of: 5))
