//
//  Bundle+json.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import Foundation

enum JSONError: String, Error {
    case notFound
    case parse
}

extension Bundle {

    func readJSONData(`for` fileName: String) -> Data? {

        if let path = self.path(forResource: fileName, ofType: "json") {
            let data = try? Data(contentsOf: URL(fileURLWithPath: path))
            return data!
        }
        return nil
    }
    func readJSONObject(`for` fileName: String) -> [String: AnyObject]? {
        let data = self.readJSONData(for: fileName)

        let json = try? JSONSerialization.jsonObject(
            with: data!,
            options: [.allowFragments]
        )

        guard let result = json as? [String: AnyObject] else {
            return nil
        }
        return result
    }
    func readJSONArray(`for` fileName: String) -> [[String: AnyObject]]? {
        let data = self.readJSONData(for: fileName)
        let json = try? JSONSerialization.jsonObject(
            with: data!,
            options: [.allowFragments]
        )

        guard let result = json as? [[String: AnyObject]] else {
            return nil
        }
        return result
    }
}
