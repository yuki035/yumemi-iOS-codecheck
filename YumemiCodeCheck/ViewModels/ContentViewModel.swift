//
//  ContentViewModel.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/24.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var birthday: Date = Date()
    @Published var bloodType: Blood = .typeA

    @Published var prefecture: Prefecture?

    let apiClient = YumemiAPIClient(urlSession: .shared, urlRequestBuilder: URLRequestBuilder())

    func onTapFortuneTelling() async {
        do {
            let request = Person(name: name, birthday: birthday, bloodType: bloodType)
            let response = try await apiClient.send(request)
            DispatchQueue.main.async {
                self.prefecture = response
            }
        } catch {
            // エラー処理
            print("error")
        }
    }
}
