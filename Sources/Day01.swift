import Algorithms

struct Day01: AdventDay {
  var data: String

  var entities: [[Int]] {
    let rows = data.split(separator: "\n")
    
    let (firstColumn, secondColumn) = rows.reduce(into: ([Int](), [Int]())) { result, row in
      let columns = row.split(separator: " ").compactMap { Int($0) }
      if columns.count == 2 {
        result.0.append(columns[0])
        result.1.append(columns[1])
      }
    }
    
    return [firstColumn, secondColumn]
  }

  func part1() -> Any {
    var ans = 0
    
    let firstColumnSorted = entities[0].sorted()
    let secondColumnSorted = entities[1].sorted()

    for i in 0...firstColumnSorted.count - 1 {
      ans += abs(firstColumnSorted[i] - secondColumnSorted[i])
    }
    return ans
  }
  
  func part2() -> Any {
    var ans = 0
    var ocurrences: [Int: Int] = [:]
    
    for i in entities[1] {
      ocurrences[i] = (ocurrences[i] ?? 0) + 1
    }
    
    for i in entities[0] {
      ans += (i * (ocurrences[i] ?? 0))
    }

    return ans
  }
}
