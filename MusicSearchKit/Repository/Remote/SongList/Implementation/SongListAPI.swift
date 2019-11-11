//
//  SongListAPI.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import PromiseKit

public class SongListAPI: SongListRemoteAPI {

    private let manager: ManagerRequestAPI

    public init(manager: ManagerRequestAPI) {
        self.manager = manager
    }

    public func getSongs(search: String) -> Promise<[SongModel]> {
        let endpoint: SongListEndpoint = .search(term: search, limit: 200)
        return Promise<[SongModel]> { seal in
            manager.request(endpoint.fullpath, method: .get, parameters: [:], headers: [:]) { (data, result) in
                switch result {
                case .success(_):
                    let encoder = JSONDecoderDateFormatter()
                    do {
                        let dataResponse = try encoder.decode(SongResponseModel.self, from: data!)
                        seal.fulfill(dataResponse.results)
                    } catch {
                        seal.reject(error)
                    }
                case .error(let err):
                    seal.reject(err)
                }
            }
        }
    }
}
