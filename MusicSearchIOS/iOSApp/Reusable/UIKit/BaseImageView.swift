//
//  BaseImageView.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

public class BaseImageView: UIImageView {

    public init() {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = 10
    }

    public required init?(coder: NSCoder) {
        return nil
    }
}
