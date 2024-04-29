//
//  PersonInputScreen.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/29.
//

import SwiftUI

struct PersonInputScreen: View {

    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 40) {
                IntroductionView()

                PersonInputView(viewModel: viewModel)
            }

            Spacer()

            Button {
                Task {
                    await viewModel.onTapFortuneTelling()
                }
            } label: {
                Text("占う")
            }
            .buttonStyle(RoundedRectangleButtonStyle(backgroundColor: .purple))
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 16)
    }
}

#Preview {
    PersonInputScreen(viewModel: ContentViewModel())
}
