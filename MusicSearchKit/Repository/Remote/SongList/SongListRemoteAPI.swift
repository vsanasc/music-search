//
//  SongListRemoteAPI.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import PromiseKit

public protocol SongListRemoteAPI {
    func getSongs(search: String) -> Promise<[SongModel]>
}
