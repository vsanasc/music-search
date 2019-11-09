//
//  String+cleanpath.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import Foundation

extension String {
    var removeslashes: String {
        return self.replacingOccurrences(of: "/", with: "")
    }
}
