//
//  String+cleanpath.swift
//  SBrainKit
//
//  Created by Vitor S do Nascimento on 04-11-19.
//  Copyright © 2019 Second Brain Project. All rights reserved.
//

import Foundation

extension String {
    var removeslashes: String {
        return self.replacingOccurrences(of: "/", with: "")
    }
}
