//
//  URLSessionNetworkRequestAPI.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import PromiseKit

public class URLSessionManagerRequestAPI: ManagerRequestAPI {

    private let manager = URLSession.shared

    public init() { }

    public func request(_ url: String, method: NetworkHTTPMethod, parameters: Parameters, headers: HTTPHeaders, completion: @escaping NetworkCompletion) {

        guard let path = URL(string: url) else {
            completion(nil, NetworkResult.error(NetworkError.urlError))
            return
        }

        var request = URLRequest(url: path)
        request.httpMethod = method.rawValue
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])

        // Build Auth Header
        for key in headers.keys {
            request.addValue(key, forHTTPHeaderField: headers[key]!)
        }

        // Send Data Task
        manager.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, NetworkResult.error(error))
                return
            }
            let httpResponse = response as? HTTPURLResponse
            guard 200..<300 ~= httpResponse!.statusCode else {
                completion(nil, NetworkResult.error(NetworkError.httpError))
                return
            }
            completion(data, NetworkResult.success(httpResponse!))
        }.resume()
    }
}
