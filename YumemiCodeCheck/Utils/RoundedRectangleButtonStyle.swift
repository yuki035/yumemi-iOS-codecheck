//
//  RoundedRectangleButtonStyle.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/29.
//

import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {

    let backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundStyle(.white)
                .font(.title3)
                .bold()
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
}

#Preview {
    Button(action: {}, label: {
        Text("テスト")
    })
    .buttonStyle(RoundedRectangleButtonStyle(backgroundColor: Color.purple))
}
