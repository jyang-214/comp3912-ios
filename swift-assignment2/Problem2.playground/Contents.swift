import UIKit

struct Point {
    var x: Int
    var y: Int

    mutating func reset(){
        x = 0
        y = 0
    }
    
    static func printPoint(_ point: Point) {
            print("The point is at coordinate [\(point.x),\(point.y)]")
        }
    
    static func average(of points: [Point], for character: Character) -> Double? {
            var sum = 0
            let count = points.count
            
            switch character {
            case "x":
                sum = points.reduce(0) { $0 + $1.x }
            case "y":
                sum = points.reduce(0) { $0 + $1.y }
            default:
                return nil
            }
            
            return Double(sum) / Double(count)
        }
    
    static func vectorAverage(of points: [Point]) -> Point? {
            guard let averageX = average(of: points, for: "x"),
                  let averageY = average(of: points, for: "y") else {
                return nil
            }
            
            return Point(x: Int(averageX), y: Int(averageY))
        }
}
