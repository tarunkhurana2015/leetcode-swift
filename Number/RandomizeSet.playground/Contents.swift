import UIKit

struct RandomizeSet<T: Hashable> {
    var storage = Set<T>()
    
    mutating func insert(_ value: T) -> Bool {
        return storage.insert(value).inserted
    }
    
    mutating func remove(_ value: T) -> Bool {
        return (storage.remove(value) != nil) ? true : false
    }
    
    func getRandom() -> T? {
        return storage.randomElement()
    }
}


var randomize = RandomizeSet<Int>()
print(randomize.insert(1))
print(randomize.remove(2))
print(randomize.insert(2))
print(randomize.getRandom())
print(randomize.remove(1))
print(randomize.insert(2))
print(randomize.getRandom())
