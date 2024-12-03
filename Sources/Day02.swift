import Algorithms

struct Day02: AdventDay {
  var data: String
  
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }
  
  func part1() -> Any {
    var reports = 0
    
    for row in entities {
      var safe = true
      
      for i in 1...row.count - 2 {
        if((row[i] >= row[i-1] && row[i] >= row[i+1]) || (row[i] <= row[i-1] && row[i] <= row[i+1]) || (abs(row[i] - row[i-1]) > 3 || abs(row[i] - row[i+1]) > 3)) {
          safe = false
          break
        }
      }

      if(safe) {
        reports += 1
      }
    }
    
    return reports
  }
  
//  func part2() -> Any {
//    var reports = 0
//    
//    for row in entities {
//      var safe = true
//      
//      for i in 1...row.count - 2 {
//        if((row[i] >= row[i-1] && row[i] >= row[i+1]) || (row[i] <= row[i-1] && row[i] <= row[i+1]) || (abs(row[i] - row[i-1]) > 3 || abs(row[i] - row[i+1]) > 3)) {
//          var aRow = row, safeTwo = true
//          aRow.remove(at: i)
//
//          for i in 1...aRow.count - 2 {
//            if((aRow[i] >= aRow[i-1] && aRow[i] >= aRow[i+1]) || (aRow[i] <= aRow[i-1] && aRow[i] <= aRow[i+1]) || (abs(aRow[i] - aRow[i-1]) > 3 || abs(aRow[i] - aRow[i+1]) > 3)) {
//              safeTwo = false
//              break
//            }
//          }
//          
//          if(safeTwo) {
//            reports += 1
//            safe = true
//            break
//          }
//          
//          safe = false
//          break
//        }
//      }
//
//      if(safe) {
//        reports += 1
//      }
//    }
//    
//    return reports
//  }
}
