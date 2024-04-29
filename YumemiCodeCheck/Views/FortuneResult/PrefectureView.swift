//
//  PrefectureView.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/28.
//

import SwiftUI

struct PrefectureView: View {

    let prefecture: Prefecture

    var body: some View {
        VStack(spacing: 4) {
            AsyncImage(url: URL(string: prefecture.logoUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
            } placeholder: {
                ProgressView()
            }

            Text(prefecture.name)

            Text(prefecture.capital)

            if let citizenDay = prefecture.citizenDay {
                Text("県民の日: \(citizenDay.toString())")
            }

            Text("海岸線: \(prefecture.hasCoastLine ? "ある" : "ない")")

            Text(prefecture.brief)
                .font(.caption)
        }
        .padding(12)
        .background(Color(UIColor.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    PrefectureView(prefecture: Prefecture.sampleData)
}
