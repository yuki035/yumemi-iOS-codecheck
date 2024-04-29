//
//  PersonInputView.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/24.
//

import SwiftUI

struct PersonInputView: View {

    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(spacing: 8) {
                HStack {
                    Text("名前")
                        .fontWeight(.semibold)

                    TextField("ここに入力", text: $viewModel.name)
                        .multilineTextAlignment(TextAlignment.trailing)
                        .padding(.trailing, 4)
                }

                Divider()
            }

            VStack(spacing: 8) {
                HStack(alignment: .center, spacing: 8) {
                    Text("誕生日")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    DatePicker("", selection: $viewModel.birthday, displayedComponents: .date)
                        .environment(\.locale, Locale(identifier: "ja_JP"))
                        .labelsHidden()
                }

                Divider()
            }

            VStack(spacing: 8) {
                HStack(alignment: .center, spacing: 8) {
                    Text("血液型")
                        .fontWeight(.semibold)
                        .buttonStyle(.bordered)

                    Spacer()

                    Picker("", selection: $viewModel.bloodType) {
                        ForEach(Blood.allCases) { type in
                            Text(type.toUpperCaseString() + "型")
                                .tag(type)
                        }
                    }
                }

                Divider()
            }
        }
    }
}

#Preview {
    PersonInputView()
}
