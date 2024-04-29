//
//  ContentView.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        VStack(spacing: 40) {
            PersonInputView(viewModel: viewModel)

            Button {
                Task {
                    await viewModel.onTapFortuneTelling()
                }
            } label: {
                Text("占う")
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            if let prefecture = viewModel.prefecture {
                PrefectureView(prefecture: prefecture)
            } else {
                Text("nil")
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ContentView()
}
