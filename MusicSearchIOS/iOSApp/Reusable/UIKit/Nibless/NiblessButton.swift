//
//  NiblessButton.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

open class NiblessButton: UIButton {
    public static let fatalMessage = "init(coder:) has not been implemented"
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder: NSCoder) {
        fatalError(NiblessButton.fatalMessage)
    }

}
