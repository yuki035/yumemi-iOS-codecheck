//
//  PrefectureDataCellView.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/30.
//

import SwiftUI

struct PrefectureDataCellView: View {

    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)

            Text(value)
                .fontWeight(.medium)
            Divider()
        }
    }
}

#Preview {
    PrefectureDataCellView(title: "県庁所在地", value: "徳島市")
}
