//
//  ARCPractiveViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/18.
//

import UIKit

class ARCPractiveViewController : UIViewController {
    var changhwi: Person?
    var silver: MacBook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObjects()
        assignProperties()
    }
    
    func createObjects() {
        changhwi = Person(name: "Changhwi", makbook: nil)
        silver = MacBook(name: "Silver", owner: nil)
        
//        changhwi = nil
//        silver = nil
    }
    
    func assignProperties() {
        changhwi?.makbook = silver
        silver?.owner = changhwi
        
        changhwi = nil
        silver = nil
        print("해제 됐나")
    }
    
    
}

class Person {
    let name: String
    weak var makbook: MacBook?
    
    init(name: String, makbook: MacBook?) {
        self.name = name
        self.makbook = makbook
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}


class MacBook {
    let name: String
    var owner: Person?
    
    init(name: String, owner: Person?) {
        self.name = name
        self.owner = owner
    }
    
    deinit {
        print("Macbook named \(name) is being deinitialized")
    }
}
