import UIKit

enum AppleDevice {
    case iPhoneXs
    case iPhoneXR
    case iPhone8
    case iPhone7
    
    var price: Int {
        switch self {
        case .iPhoneXs:
            return 1000
        case .iPhoneXR:
            return 1100
        case .iPhone8:
            return 800
        case .iPhone7:
            return 750
        }
    }
}


// Accessing the price of each AppleDevice
let xsPrice = AppleDevice.iPhoneXs.price
let xrPrice = AppleDevice.iPhoneXR.price
let eightPrice = AppleDevice.iPhone8.price
let sevenPrice = AppleDevice.iPhone7.price

print("iPhoneXs price: $\(xsPrice)")
print("iPhoneXR price: $\(xrPrice)")
print("iPhone8 price: $\(eightPrice)")
print("iPhone7 price: $\(sevenPrice)")

