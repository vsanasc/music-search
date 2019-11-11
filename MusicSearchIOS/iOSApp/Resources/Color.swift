//
//  Color.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 10-11-19.
//

import UIKit

func loadColor(_ named: String) -> UIColor {
    return UIColor(named: named, in: Bundle.main, compatibleWith: nil)!
}

public struct Color {
    public let primary = loadColor("PrimaryColor")
    public let lightGray = loadColor("LightGray")
}
