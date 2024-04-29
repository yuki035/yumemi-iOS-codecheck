//
//  Prefecture.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/28.
//

import Foundation

struct Prefecture: Decodable {
    let name: String
    let capital: String
    let citizenDay: MonthDay?
    let hasCoastLine: Bool
    let logoUrl: String
    let brief: String

    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case citizenDay = "citizen_day"
        case hasCoastLine = "has_coast_line"
        case logoUrl = "logo_url"
        case brief
    }
}

extension Prefecture {
    // Preview用
    static var sampleData: Prefecture {
        return Prefecture(name: "富山県",
                          capital: "富山市",
                          citizenDay: MonthDay(month: 5, day: 9),
                          hasCoastLine: true,
                          logoUrl: "https://japan-map.com/wp-content/uploads/toyama.png",
                          brief: """
                            富山県（とやまけん）は、日本の中部地方に位置する県。県庁所在地は富山市。
                            中部地方の日本海側、新潟県を含めた場合の北陸地方のほぼ中央にある。
                            ※出典: フリー百科事典『ウィキペディア（Wikipedia）』
                            """)
    }
}
