//
//  Camping.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/11.
//

import Foundation

struct Camping : Codable {
    let response : Response
}

struct Response : Codable {
    let body : Body
}
struct Body : Codable {
    let items : Items
}
struct Items : Codable {
    let item : [Items]
}
struct Item : Codable {
    let facltNM : String /// 캠핑장 이름
    let lineIntro : String /// 한줄 소개
    let intro : String /// 긴줄 소개
    let homePage : String ///홈페이지 링크
    let firstImageUrl : String /// 이미지
    let mapY : String ///경도
    let mapX : String ///위도
}
