//
//  BaseLabel.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

public class BaseLabel: UILabel {

    public init() {
        super.init(frame: .zero)
        self.numberOfLines = 0
    }

    required init?(coder: NSCoder) {
        return nil
    }
}
