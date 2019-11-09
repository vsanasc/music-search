//
//  ImageCache.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

public protocol ImageCache {
    func setImage(
        _ imageView: UIImageView,
        url: URL,
        placeholder: UIImage?,
        completion: ((Data?, UIImage?, Error?) -> Void)?
    )
}
