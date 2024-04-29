//
//  PersonInputView.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/24.
//

import SwiftUI

struct PersonInputView: View {

    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            InputRowView(title: "名前") {
                TextField("ここに入力", text: $viewModel.name)
                    .multilineTextAlignment(TextAlignment.trailing)
                    .padding(.trailing, 8)
            }

            InputRowView(title: "誕生日") {
                DatePicker("", selection: $viewModel.birthday, displayedComponents: .date)
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .labelsHidden()
            }

            InputRowView(title: "血液型") {
                Picker("", selection: $viewModel.bloodType) {
                    ForEach(Blood.allCases) { type in
                        Text(type.toUpperCaseString() + "型")
                            .tag(type)
                    }
                }
            }
        }
    }

    private struct InputRowView<T: View>: View {

        let title: String
        @ViewBuilder var content: () -> T

        var body: some View {
            VStack(spacing: 8) {
                HStack {
                    Text(title)
                        .fontWeight(.semibold)

                    Spacer()

                    content()
                }

                Divider()
            }
        }
    }
}

#Preview {
    PersonInputView(viewModel: ContentViewModel())
}
