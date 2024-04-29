//
//  URLRequestBuilder.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/28.
//

import Foundation

struct URLRequestBuilder {
    func buildURLRequest<T: YumemiAPIRequest>(from request: T) -> URLRequest? {
        let urlComponents = URLComponents(
            url: request.baseURL.appendingPathComponent(request.path),
            resolvingAgainstBaseURL: false
        )

        guard let url = urlComponents?.url else {
            return nil
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("v1", forHTTPHeaderField: "API-Version")

        do {
            urlRequest.httpBody = try request.toData()
        } catch {
            return nil
        }

        return urlRequest
    }
}
