import Algorithms

struct Day03: AdventDay {
  var data: String
  
  func part1() -> Any {
    var res = 0, i = 0
    
    while(i <= data.count - 4) {
      let start = data.index(data.startIndex, offsetBy: i)
      let end = data.index(data.startIndex, offsetBy: i + 4)
      let range = start..<end
      
      if(data[range] == "mul(") {
        var str = "", k = true
        
        while(k) {
          let pos = data.index(data.startIndex, offsetBy: i + 4)
         
          if(!data[pos].isNumber && data[pos] != ",") {
            k = false
            break
          }
          
          str += String(data[pos])
          i += 1
        }

        if(data[data.index(data.startIndex, offsetBy: i + 4)] != ")") {
          continue
        }
        var num1 = 0, num2 = 0
        
        let parts = str.split(separator: ",")
        if parts.count == 2 {
          num1 = Int(parts[0].trimmingCharacters(in: .whitespaces)) ?? 0
          num2 = Int(parts[1].trimmingCharacters(in: .whitespaces)) ?? 0

          res += (num1 * num2)
        }
      }
      
      i += 1
    }
    
    return res
  }
}
