class Graph {
    var conntectedList: [Int: [Int]]
    init() {
        conntectedList = [:]
    }
    func addEdge(from source: Int, ro destination: Int) {
        
        if conntectedList[source] != nil {
            conntectedList[source]?.append(destination)
        } else {
            conntectedList[source] = [destination]
        }
        
        if conntectedList[destination] != nil {
            conntectedList[destination]?.append(source)
        } else {
            conntectedList[destination] = [source]
        }
    }
    
    func getEdges(from: Int) -> [Int] {
        return conntectedList[from] ?? []
    }
    
    func findTransitiveDepencies(from node: Int) -> Set<Int> {
        var visited = Set<Int>()
        var stack = [node]
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            if !visited.contains(current) {
                visited.insert(current)
                stack.append(contentsOf: getEdges(from: current))
            }
            
        }
        visited.remove(node)
        return visited
    }
}

func maxCircle(queries: [[Int]]) -> [Int] {
    
    var maxCircle = [Int]()
    let graph = Graph()
    for query in queries {
        graph.addEdge(from: query[0], ro: query[1])
        let transitive1 = graph.findTransitiveDepencies(from: query[0])
        let transitive2 = graph.findTransitiveDepencies(from: query[1])
        let transitive = transitive1.union(transitive2)
        maxCircle.append(transitive.count)
    }
    
    return maxCircle
    
}

let counts = maxCircle(queries: [[1,2],[3,4],[2,3]])
print(counts)

let counts1 = maxCircle(queries: [[1,2],[3,4],[1,3],[5,7],[5,6],[7,4]])
print(counts1)
