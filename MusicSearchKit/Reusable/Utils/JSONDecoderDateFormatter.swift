//
//  JSONDecoderDateFormatter.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

class JSONDecoderDateFormatter: JSONDecoder {
    override init() {
        super.init()

        self.dateDecodingStrategy = .formatted(DateFormatter.iso860Full)

    }
}
