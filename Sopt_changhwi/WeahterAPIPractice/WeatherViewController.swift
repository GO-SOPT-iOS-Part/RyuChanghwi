//
//  WeatherViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/06.
//

import UIKit

class WeatherViewController : UIViewController {
    // MARK: - PROPERTIES
    
    let cities = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    var name : String = ""
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getWeathers(cities : [String]) {
        for i in cities {
            WeatherService.shared.getWeather(city: i) {
                response in
                print(response)
                switch response {
                case .success(let data):
                    guard let data = data as? Weathers else {
                        return
                    }
                    dump(data.name)
                default:
                    return
                }
            }
        }
    }
    
    
    // MARK: - ACTIONS
}
// MARK: - EXTENSIONs
extension WeatherViewController {
    
}

