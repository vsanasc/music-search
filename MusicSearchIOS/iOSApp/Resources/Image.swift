//
//  Image.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 10-11-19.
//

import UIKit

func loadImage(_ named: String, renderingMode: UIImage.RenderingMode = .alwaysOriginal) -> UIImage {
    return UIImage(
        named: named,
        in: Bundle.main,
        compatibleWith: nil
    )!.withRenderingMode(renderingMode)
}

public struct Image {
    public let song = loadImage("song")
    public let options = loadImage("options")
    public let play = loadImage("play")
    public let goAlbum = loadImage("go-album")
}
