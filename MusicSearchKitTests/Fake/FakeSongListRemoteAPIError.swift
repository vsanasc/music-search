//
//  FakeSonglistRemoteAPIError.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import Foundation
import PromiseKit
@testable import MusicSearchKit

class FakeSongListRemoteAPIError: SongListRemoteAPI {
    func getSongs(search: String) -> Promise<[SongModel]> {
        return Promise<[SongModel]> { seal in
            seal.reject(NetworkError.httpError)
        }
    }
}
