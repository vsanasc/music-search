//
//  ErrorMessage.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

public struct ErrorMessage: Error {

    private enum Defaults {
        static let title = "An error occurred"
        static let message = "Conection lost. Try again later!"
    }
    let id: UUID
    let title: String
    let message: String

    init(title: String? = nil, message: String? = nil) {
        self.id = UUID()
        self.title = title ?? Defaults.title
        self.message = message ?? Defaults.message
    }

}

extension ErrorMessage: Equatable {
}
