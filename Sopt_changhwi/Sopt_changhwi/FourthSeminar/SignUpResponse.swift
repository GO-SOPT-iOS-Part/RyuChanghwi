//
//  SignUpResponse.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/06.
//

import Foundation
struct SignUpResponse: Codable {
    let code: Int
    let success: Bool?
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let userId: Int
    let nickname: String
}
