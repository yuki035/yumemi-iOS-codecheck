//
//  YumemiAPIClient.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/28.
//

import Foundation

enum HTTPError: Error {
    case parseError
    case invalidRequest
    case invalidResponse
    case unknownError
}

struct YumemiAPIClient {
    private let urlSession: URLSession
    private let urlRequestBuilder: URLRequestBuilder

    init(urlSession: URLSession, urlRequestBuilder: URLRequestBuilder) {
        self.urlSession = urlSession
        self.urlRequestBuilder = urlRequestBuilder
    }

    func send<Request: YumemiAPIRequest>(_ request: Request) async throws -> Request.Response {
        guard let urlRequest = urlRequestBuilder.buildURLRequest(from: request), urlRequest.url != nil else {
            throw HTTPError.invalidRequest
        }

        debugRequest(urlRequest)

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            debugResponse(response as? HTTPURLResponse, data: data)

            guard let httpURLResponse = response as? HTTPURLResponse else {
                throw HTTPError.invalidResponse
            }

            switch httpURLResponse.statusCode {
            case 200:
                print("200")
                return try request.parseResponse(from: data, httpURLResponse: httpURLResponse)
            default:
                throw HTTPError.unknownError
            }
        } catch {
            throw HTTPError.parseError
        }
    }
}

private extension YumemiAPIClient {
    func debugResponse(_ response: HTTPURLResponse?, data: Data) {
        #if DEBUG
        let body: String

        guard let response = response else {
            return print("Response Error")
        }

        do {
            let json = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
            body = String(data: prettyData, encoding: .utf8) ?? "nil"
        } catch {
            print("\(error)")
            body = "nil"
        }

        var output: [String] = []

        output.append("=========== HTTP RESPONSE ===========")
        output.append("[Response]: \(response.url!)") // original url request
        output.append("[Status Code]: \(response.statusCode)")
        output.append("[Header]: \(response.allHeaderFields as? [String: String])")
        output.append("[Body]: \(body)")

        let outputString = output.joined(separator: "\n")

        print(outputString)

        #endif
    }

    func debugRequest(_ url: URLRequest) {
        #if DEBUG
        var output: [String] = []

        output.append("=========== HTTP REQUEST ===========")
        output.append("[Request]: \(url.httpMethod!) \(url.url!)")
        output.append("[Header]: \(url.allHTTPHeaderFields!)")
        if let body = url.httpBody {
            output.append("[Body]: \(String(data: body, encoding: String.Encoding.utf8) ?? "")")
        }

        let outputString = output.joined(separator: "\n")

        print(outputString)

        #endif
    }
}
