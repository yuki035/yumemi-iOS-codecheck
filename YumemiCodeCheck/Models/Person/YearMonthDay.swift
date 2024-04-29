//
//  YearMonthDay.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/28.
//

import Foundation

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
