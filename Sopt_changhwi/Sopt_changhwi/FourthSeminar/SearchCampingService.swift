//
//  SearchCampingService.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/11.
//

import Foundation
import Alamofire

final class SearchCampingService {
    static let shared = SearchCampingService()
    
    private init() {}
    
    func searchCapming(completion: @escaping (NetworkResult<Any>) -> Void) {
        let baseURL = "http://apis.data.go.kr/B551011/GoCamping"
        let url = baseURL + "/basedList"
        let serviceKey = "CMNCkuO347YPH0lZvGJN68%2BNmjNO4nnvbhqqL1p2xsOoClvFZEh2MqejFpgx08CgHNK8dUKYme7ehPmmh8mGgw%3D%3D"
        let params : Parameters = [
            "numOfRows" : "20",
            "pageNo" : "20",
            "MobileOS" : "IOS",
            "MobileApp" : "changhwi",
            "serviceKey" : serviceKey,
            "_type" : "json"
        ]
        let dataRequest = AF.request("\(baseURL)/basedList?numOfRows=10&pageNo=10&MobileOS=IOS&MobileApp=changhwi&serviceKey=\(serviceKey)&_type=json",
                                     method: .get,
                                     parameters: nil,
                                     headers: nil)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkErr)
            }
        }
        
    }
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200, 400, 409:
            return isValidData(data: data)
        case 500:
            return .serverErr
        default:
            return .networkErr
        }
    }

    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        print(data, "데이터")
        if let decodedData = try? decoder.decode(CampingResposne.self, from: data) {
            print(decodedData, "ㅇㅇㅇ")
            return .success(decodedData as Any)
        } else {
            return .networkErr // or .networkErr, depending on your needs
        }
    }
}

