//
//  DateFormatter+iso.swift
//  SBrainKit
//
//  Created by Vitor S do Nascimento on 02-11-19.
//  Copyright © 2019 Second Brain Project. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let iso860Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        return formatter
    }()
}
