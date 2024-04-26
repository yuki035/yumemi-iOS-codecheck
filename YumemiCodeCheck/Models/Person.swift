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

struct YearMonthDay: Codable {
    let year: Int
    let month: Int
    let day: Int
}

extension YearMonthDay {
    init(from date: Date) {
        let calendar = Calendar(identifier: .gregorian)
        self.year = calendar.component(.year, from: date)
        self.month = calendar.component(.month, from: date)
        self.day = calendar.component(.day, from: date)
    }
}

enum Blood: String, Codable, CaseIterable, Identifiable {
    case typeA = "a"
    case typeB = "b"
    case typeAB = "ab"
    case typeO = "o"

    var id: String { rawValue }

    func toUpperCaseString() -> String {
        return self.rawValue.uppercased()
    }
}
