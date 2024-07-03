import UIKit

func oceanViewBuildings(_ heights: [Int]) -> [Int] {
    
    var oceanViewIndices: [Int] = []
    var maxHeight = 0
    
    //for i in stride(from: heights.count-1, through: 0, by: -1) {
    for i in (0..<heights.count).reversed() {
        let height = heights[i]
        
        if height > maxHeight {
            oceanViewIndices.append(i)
            maxHeight = height
        }
    }
    return oceanViewIndices.reversed()
}
let buildings = [4,3,2,3,1]
let oceanViewIndices = oceanViewBuildings(buildings)
print("Indices of buildings with ocean view: \(oceanViewIndices)")
