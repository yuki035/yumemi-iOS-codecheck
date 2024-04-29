//
//  Person.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/26.
//

import Foundation

struct Person: Codable {
    let name: String
    let birthday: YearMonthDay
    let bloodType: Blood
    let today: YearMonthDay

    enum CodingKeys: String, CodingKey {
        case name
        case birthday
        case bloodType = "blood_type"
        case today
    }
}

extension Person {
    init(name: String, birthday: Date, bloodType: Blood) {
        self.name = name
        self.birthday = YearMonthDay(from: birthday)
        self.bloodType = bloodType
        self.today = YearMonthDay(from: Date())
    }
}

extension Person: YumemiAPIRequest {
    typealias Response = Prefecture

    var path: String {
        "/my_fortune"
    }

    var method: HTTPMethod {
        .post
    }

    func toData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
