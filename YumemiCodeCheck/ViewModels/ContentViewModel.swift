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
    @Published var errorType: PersonInputError?
    @Published var isLoading: Bool = false

    @Published var isAlert: Bool = false

    let apiClient = YumemiAPIClient(urlSession: .shared, urlRequestBuilder: URLRequestBuilder())

    func onTapFortuneTelling() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }

        do {
            // API通信
            let request = try validatePerson()
            let response = try await apiClient.send(request)
            DispatchQueue.main.async {
                self.prefecture = response
            }
        } catch let personInputError as PersonInputError {
            // Personに関するエラー処理
            DispatchQueue.main.async {
                self.errorType = personInputError
                self.isAlert = true
            }
        } catch {
            // httpに関するエラー処理
            if let httpError = error as? HTTPError {
                DispatchQueue.main.async {
                    self.errorType = .apiError
                    self.isAlert = true
                }
            }
        }

        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}

// MARK: - Alert

extension ContentViewModel {
    enum PersonInputError: LocalizedError {
        case apiError
        case nameEmptyError
        case nameTooLongError   // nameが128字以上の場合

        var errorDescription: String? {
            switch self {
            case .apiError:
                return "通信エラーが発生しました"
            case .nameEmptyError:
                return "名前を入力してください"
            case .nameTooLongError:
                return "名前が長すぎます。\n128文字未満で入力してください。"
            }
        }
    }

    func validatePerson() throws -> Person {
        guard !name.isEmpty else {
            throw PersonInputError.nameEmptyError
        }

        guard name.count < 128 else {
            throw PersonInputError.nameTooLongError
        }

        return Person(name: name, birthday: birthday, bloodType: bloodType)
    }
}
