//
//  BaseImageView.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

public class BaseImageView: NiblessImageView {

    public init() {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
