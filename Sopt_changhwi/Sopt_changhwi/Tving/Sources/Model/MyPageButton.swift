//
//  MyPageButton.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/03.
//

import Foundation

struct MyPageButton {
    let title : String
}

extension MyPageButton {
    static func dummy1() -> [MyPageButton] {
        return [MyPageButton(title: "이용권"),
                MyPageButton(title: "1:1 문의내역"),
                MyPageButton(title: "예약알림"),
                MyPageButton(title: "회원정보 수정"),
                MyPageButton(title: "프로모션 정보 수신 동의")]
    }
    static func dummy2() -> [MyPageButton] {
        return [MyPageButton(title: "공지사항"),
                MyPageButton(title: "이벤트"),
                MyPageButton(title: "고객센터"),
                MyPageButton(title: "티빙 알아보기"),]
    }
}
