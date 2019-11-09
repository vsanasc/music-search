//
//  ImageCacheKingfisher.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit
import Kingfisher

class ImageCacheKingfisher: ImageCache {
    private let manager  = KingfisherManager.shared

    func setImage(_ imageView: UIImageView, url: URL, placeholder: UIImage?, completion: ((Data?, UIImage?, Error?) -> Void)? = nil) {

        imageView.image = placeholder

        manager.retrieveImage(with: url) { result in
            switch result {
            case .failure(let error):
                completion?(nil, nil, error)
            case .success(let imageResult):
                imageView.image = imageResult.image
                completion?(imageResult.image.pngData(), imageResult.image, nil)
            }
        }
    }
}
