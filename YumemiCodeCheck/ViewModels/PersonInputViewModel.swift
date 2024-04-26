//
//  PersonInputViewModel.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/24.
//

import Foundation

final class PersonInputViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var birthday: Date = Date()
    @Published var bloodType: Blood = .typeA
}
