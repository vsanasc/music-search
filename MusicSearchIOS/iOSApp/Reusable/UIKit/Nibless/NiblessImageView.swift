//
//  NiblessImageView.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

open class NiblessImageView: UIImageView {

    static public let fatalMessage = "init(coder:) has not been implemented"

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(NiblessImageView.fatalMessage)
    }

}
