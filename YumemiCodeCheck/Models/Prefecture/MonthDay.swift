//
//  MonthDay.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/28.
//

import Foundation

struct MonthDay: Codable {
    let month: Int
    let day: Int

    func toString() -> String {
        return "\(month)月\(day)日"
    }
}
