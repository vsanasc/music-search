//
//  FakeManagerRequestAPI.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import Foundation
import MusicSearchKit

class FakeManagerRequestAPI: ManagerRequestAPI {

    init() { }

    func request(_ url: String, method: NetworkHTTPMethod, parameters: Parameters, headers: HTTPHeaders, completion: @escaping NetworkCompletion) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.rawValue
        for key in headers.keys {
            request.addValue(key, forHTTPHeaderField: headers[key]!)
        }

        // Send Data Task
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
              completion(nil, NetworkResult.error(NetworkError.unknownError))
              return
            }
            completion(data, NetworkResult.success(httpResponse))
        }.resume()
    }
}
