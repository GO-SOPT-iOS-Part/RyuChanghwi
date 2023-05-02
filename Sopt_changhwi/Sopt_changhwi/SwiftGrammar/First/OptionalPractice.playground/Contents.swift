import Cocoa
import UIKit


var intValue : Int = 0
var optionalIntValue : Int? = 0

print(intValue) // 0
print(optionalIntValue) // Optional(0)
print(optionalIntValue!) // 0
var optionalInt : Int?
var optionalInt2 : Int? = nil

print(optionalInt) // nil
//print(optionalInt!)
print(optionalInt2) // nil


var name : String?

print(name ?? "창휘") //창휘
