//
//  YumemiAPIRequest.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/28.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

protocol YumemiAPIRequest {
    associatedtype Response

    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }

    func toData() throws -> Data
    func parseResponse(from data: Data, httpURLResponse: HTTPURLResponse) throws -> Response
}

extension YumemiAPIRequest {
    var baseURL: URL {
        URL(string: "https://yumemi-ios-junior-engineer-codecheck.app.swift.cloud")!
    }
}

extension YumemiAPIRequest where Response: Decodable {
    func parseResponse(from data: Data, httpURLResponse: HTTPURLResponse) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}
