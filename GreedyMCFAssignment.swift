import Foundation

func solution() {
    
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let n = firstLine[0], m = firstLine[1], d = firstLine[2]
    
    var map = [[(v: Int, w: Int, start: Bool, end: Bool)]](repeating: [], count: n+1)
    var edges = [[(v: Int, w: Int)]](repeating: [], count: n+1)
    for i in 1...m {
        let isActiveAtStart = i < n-1
        let pipeInput = readLine()!.split(separator: " ").map { Int($0)! }
        let u = pipeInput[0], v = pipeInput[1], w1 = pipeInput[2], w2 = pipeInput[2] * 10 + (isActiveAtStart ? 0 : 1)
        edges[u].append((v: v, w: w2))
        map[u].append((v: v, w: w1, start: isActiveAtStart, end: false))
        map[v].append((v: u, w: w1, start: isActiveAtStart, end: false))
    }
    
//    print(n)
//    print(m)
//    print(d)
//
//    for edge in edges {
//        print(edge)
//    }
//    print("--")
//    for p in map {
//        print(p)
//    }
    
    
    
////
    let mst = MST()
    let z = mst.kruskalMST(edges)
//    let y = z.0
    let xs = z.1
//
//    print(y)
//    print("--")
//    for x in xs {
//        print(x)
//    }
    
    edges = [[(v: Int, w: Int)]](repeating: [], count: n+1)
    
    var countSwitchOn = 0, countSwitchOff = 0
    for x in xs {
        edges[x.0].append((v: x.1, w: Int(x.2 / 10)))
        edges[x.1].append((v: x.0, w: Int(x.2 / 10)))
        for i in 0..<map[x.0].count {
            if map[x.0][i].v == x.1 {
                map[x.0][i].end = true
            }
        }
        for i in 0..<map[x.1].count {
            if map[x.1][i].v == x.0 {
                map[x.1][i].end = true
            }
        }
    }
//    print("--")
//    for p in map {
//        print(p)
//    }
    print("--")
    for edge in edges {
        print(edge)
    }
    
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j].end && !map[i][j].start {
                countSwitchOn += 1
            }
            if !map[i][j].end && map[i][j].start {
                countSwitchOff += 1
            }
        }
    }
    countSwitchOn /= 2
    countSwitchOff /= 2
    
    print(countSwitchOn)
    print(countSwitchOff)
    
    if d == 0 {
        print(max(countSwitchOn, countSwitchOff))
        return
    }
//
//    var finals = [[(v: Int, w: Int)]](repeating: [], count: n+1)
//    for i in 0..<xs.count {
//        let u = xs[i].0
//        let v = xs[i].1
//        let w = Int(xs[i].2 / 10)
//        finals[u].append((v: v, w: w))
//        finals[v].append((v: u, w: w))
//    }
//
//    print("**FINAL**")
//    print(finals[3])
//    print("**")
//    for final in finals {
//        print(final)
//    }
//
//    var initials = [[(v: Int, w: Int, start: Bool, end: Bool)]](repeating: [], count: n+1)
//    for i in 0..<edges.count {
//        for j in 0..<edges[i].count {
//            let u = i
//            let v = edges[i][j].v
//            let w = Int(edges[i][j].w / 10)
//            initials[u].append((v: v, w: w, start: edges[i][j].w % 10 == 1 ? false : true, end: false))
//            initials[v].append((v: u, w: w, start: edges[i][j].w % 10 == 1 ? false : true, end: false))
//        }
//    }
//
//    print("**INITIAL**")
//    print(initials[3])
//    print("**")
//    for initial in initials {
//        print(initial)
//    }
//
//    print("--------")
//    for i in 0..<initials.count {
//        for j in 0..<initials[i].count {
//            print(initials[i][j])
//            var end = false
//            for k in 0..<finals[i].count {
//                if initials[i][j].v == finals[i][k].v {
//                    end = true
//                }
//            }
//            initials[i][j].end = end
//        }
//    }
//
//    print("**INITIAL22222**")
//    print(initials[3])
//    print("**")
//    for initial in initials {
//        print(initial)
//    }
    

    print("--")
    
    if d != 0 {
        for i in 0..<map.count {
            for j in 0..<map[i].count {
                if d >= map[i][j].w && !map[i][j].end && map[i][j].start {
                    print("can test", map[i][j])
                    let u = i
                    let v = map[i][j].v
                    let w = map[i][j].w
                    print(u,v,w)
                    
                    var canSwitchOff = false
                    var current = v
                    while !canSwitchOff && current != u {
                        
//                        edge[current] CYCLE CYCLE!!!!!
                        
                    }
                }
            }
        }
    }
    
    
//    for (i, edge) in edges.enumerated() {
//        let u = i
//        for e in edge {
//            let v = e.v
//            print(u, v)
//        }
//    }
    
//    var a = 0
//    for x in xs {
//        if x.2 % 10 == 1 {
//            a += 1
//        }
//    }
//
//    var b = n-1 - xs.count
//    print(a, b)
}
