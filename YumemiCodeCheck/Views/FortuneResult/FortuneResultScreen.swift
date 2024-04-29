//
//  FortuneResultScreen.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/30.
//

import SwiftUI

struct FortuneResultScreen: View {

    @Environment(\.dismiss) private var dismiss
    let prefecture: Prefecture

    var body: some View {
        VStack(spacing: 30) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
                    .symbolRenderingMode(.hierarchical)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)

            PrefectureView(prefecture: prefecture)

            Spacer()

            Button("戻る") {
                dismiss()
            }
            .buttonStyle(RoundedRectangleButtonStyle(backgroundColor: .secondary))
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 16)
    }
}

#Preview {
    FortuneResultScreen(prefecture: Prefecture.sampleData)
}
