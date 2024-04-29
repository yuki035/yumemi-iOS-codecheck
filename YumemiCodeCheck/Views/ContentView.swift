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
        VStack(spacing: 0) {
            VStack(spacing: 40) {
                ZStack {
                    Image("nihonchizu")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.3)

                    VStack(spacing: 4) {
                        Text("相性のいい都道府県を")
                            .font(.title)
                            .bold()
                        Text("占ってあげる🔮")
                            .font(.title)
                            .bold()
                    }
                }

                PersonInputView(viewModel: viewModel)
            }

            Spacer()

            Button {
                Task {
                    await viewModel.onTapFortuneTelling()
                }
            } label: {
                Text("占う")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 16)
        .sheet(item: $viewModel.prefecture) { prefecture in
            PrefectureView(prefecture: prefecture)
        }
    }
}

#Preview {
    ContentView()
}
