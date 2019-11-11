//
//  String+encode-url.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import Foundation

public extension String {
    var encodeUrl: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
