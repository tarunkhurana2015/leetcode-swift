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
        
    
    /*
     Next, implement the transitive closure calculation using the Floyd-Warshall algorithm. This algorithm is suitable for dense graphs and computes the reachability of all pairs of vertices.
     */
    
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

let graph = Graph()
graph.addEdge(from: 1, ro: 2)
var depedencies1 = graph.findTransitiveDepencies(from: 1)
var depedencies2 = graph.findTransitiveDepencies(from: 2)

print(depedencies1.union(depedencies2).count)
graph.addEdge(from: 3, ro: 4)
 depedencies1 = graph.findTransitiveDepencies(from: 3)
 depedencies2 = graph.findTransitiveDepencies(from: 4)
print(depedencies1.union(depedencies2).count)
graph.addEdge(from: 2, ro: 3)
depedencies1 = graph.findTransitiveDepencies(from: 2)
depedencies2 = graph.findTransitiveDepencies(from: 3)
print(depedencies1.union(depedencies2).count)
graph.addEdge(from: 5, ro: 6)
depedencies1 = graph.findTransitiveDepencies(from: 5)
depedencies2 = graph.findTransitiveDepencies(from: 6)
print(depedencies1.union(depedencies2).count)
graph.addEdge(from: 1, ro: 6)
depedencies1 = graph.findTransitiveDepencies(from: 1)
depedencies2 = graph.findTransitiveDepencies(from: 6)
print(depedencies1.union(depedencies2).count)

