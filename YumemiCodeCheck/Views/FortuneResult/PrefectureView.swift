//
//  PrefectureView.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/28.
//

import SwiftUI

struct PrefectureView: View {

    let prefecture: Prefecture
    let imageHeihgt: CGFloat = 150

    var body: some View {
        VStack(spacing: 8) {
            Text("相性のいい都道府県は...")
                .font(.title2)
                .fontWeight(.semibold)

            VStack(spacing: 24) {
                Text(prefecture.name)
                    .font(.largeTitle)
                    .bold()

                AsyncImage(url: URL(string: prefecture.logoUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: imageHeihgt)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: imageHeihgt)

                Grid(horizontalSpacing: 24) {
                    GridRow {
                        PrefectureDataCellView(title: "県庁所在地",
                                               value: prefecture.capital)

                        PrefectureDataCellView(title: "県民の日",
                                               value: prefecture.citizenDay?.toString() ?? "なし")

                        PrefectureDataCellView(title: "海岸線",
                                               value: "\(prefecture.hasCoastLine ? "あり" : "なし")")
                    }
                }

                Text(prefecture.brief)
                    .font(.caption)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .background(Color(UIColor.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    PrefectureView(prefecture: Prefecture.sampleData)
}
