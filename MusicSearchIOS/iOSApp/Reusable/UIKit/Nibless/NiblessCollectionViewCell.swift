//
//  NiblessCollectionViewCell.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

open class NiblessCollectionViewCell: UICollectionViewCell {

    static public let fatalMessage = "init(coder:) has not been implemented"

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(NiblessCollectionViewCell.fatalMessage)
    }
}
