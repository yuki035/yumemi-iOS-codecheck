//
//  Blood.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/28.
//

import Foundation

enum Blood: String, Codable {
    case typeA = "a"
    case typeB = "b"
    case typeAB = "ab"
    case typeO = "o"

    func toUpperCaseString() -> String {
        return self.rawValue.uppercased()
    }
}

extension Blood: CaseIterable, Identifiable {
    var id: String { rawValue }
}
