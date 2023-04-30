import UIKit

//var index = 0
//var closureArr: [() -> ()] = []
//
//for _ in 1...5 {
//  closureArr.append({print(index)})
//  index += 1
//}
//
//for i in 0..<closureArr.count {
//    closureArr[i]()
//}

//var index = 0
//var closureArr: [() -> ()] = []
//
//for _ in 1...5 {
//  closureArr.append({[index] in
//           print(index)
//   })
//  index += 1
//}
//
//for i in 0..<closureArr.count {
//    closureArr[i]()
//}


var str2 = "Hello, World!"
var myClosure2 = {
print (str2)
}
str2 = "next"
let inc2 = myClosure2
inc2() //next


var str = "Hello, World!"
var myClosure = { [str] in
print (str)
}
str = "next"
let inc = myClosure
inc() //Hello, World!

protocol practice : AnyObject { //class 타입에만 쓸거야!
    func test()
}

protocol practice2 {
    func test()
}

//struct
struct Practice2: practice2 {
    func test() {
        print("헤헤")
    }
}

//class
class Practice: practice {
    func test() {
        print("헤헤")
    }
}

