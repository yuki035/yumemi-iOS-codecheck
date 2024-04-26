//
//  PersonInputView.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/24.
//

import SwiftUI

struct PersonInputView: View {

    @StateObject var viewModel = PersonInputViewModel()

    var body: some View {
        VStack {
            HStack {
                Text("名前")
                TextField("", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder)
            }

            HStack {
                Text("誕生日")
                DatePicker("", selection: $viewModel.birthday, displayedComponents: .date)
                    .datePickerStyle(.compact)
            }

            HStack {
                Text("血液型")
                Spacer()
                Picker("", selection: $viewModel.bloodType) {
                    ForEach(Blood.allCases) { type in
                        Text(type.toUpperCaseString() + "型")
                            .tag(type)
                    }
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    PersonInputView()
}
