import UIKit




class Name {
    func introduce() {
        print("소개해주세요")
    }
}

class Changhwi : Name {
    override func introduce() {
        super.introduce()
        print("나는 창휘")
        super.introduce()
    }
}

var changhwi = Changhwi()
print(changhwi.introduce())
//소개해주세요
//나는 창휘
//소개해주세요


class Age {
    static let myAge : Int = 26
    let yourAge : Int = 24
}


print(Age.myAge)
print(Age().yourAge)
