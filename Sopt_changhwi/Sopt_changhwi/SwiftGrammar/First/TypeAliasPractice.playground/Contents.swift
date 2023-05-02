
import UIKit

typealias age = Int
typealias name = String
var myAge : age = 26
var myName : name = "창휘"

struct Person {
    var name : String
    var age : Int
    var email: String
}
typealias UserList = [Person]
typealias ManagerList = [Person]

var userList: UserList = [
    UserList(name: "창휘", age: 26, email: "ckdgnl~~"),
    UserList(name: "짱휘", age: 25, email: "email@")
]
var managerList: ManagerList = [
    Manager(name: "관리자1", age: 30, email: "manager@"),
    Manager(name: "관리자2", age: 36, email: "manager~~@")
]

class MyClass {
    enum PhotoAccessType {
        case notDetermined
        case restricted
        case denied
        case authorized
        case limited
    }
    var type = PhotoAccessType.notDetermined
}

var myclass = MyClass()

myclass.type = MyClass.PhotoAccessType.notDetermined

//typealias 사용

typealias PhotoType = MyClass.PhotoAccessType
myclass.type = PhotoType.limited

//사실 이렇게 바로 할 수 있다..
myclass.type = .authorized

