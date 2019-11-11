//
//  SongListUserInterface.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 10-11-19.
//

import UIKit
import MusicSearchKit
import AVFoundation
import AVKit
import SafariServices

protocol SongListTapOptionsDelegate: class {
    func tapped(_ indexPath: IndexPath)
}

class SongListUserInterface {
    // MARK: - Dependencies
    private let viewController: SongListViewController
    private let imageCache: ImageCache

    // Player
    private let playerController = AVPlayerViewController()

    init(
        viewController: SongListViewController,
        imageCache: ImageCache
    ) {
        self.viewController = viewController
        self.imageCache = imageCache
    }
    func showOptions(item: SongModelViewModel) {

        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let playPreview = UIAlertAction(
            title: Res.localization.playPreview,
            style: .default,
            handler: playVideoAction(item)
        )
        playPreview.setValue(Res.image.play, forKey: "image")

        let goAlbum = UIAlertAction(
            title: Res.localization.goAlbum,
            style: .default,
            handler: nil
        )
        goAlbum.setValue(Res.image.goAlbum, forKey: "image")

        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        [playPreview, goAlbum, cancel].forEach { actionSheet.addAction($0) }

        DispatchQueue.main.async {
            self.viewController.present(actionSheet, animated: true, completion: nil)
        }

    }
    /*
    func goAlbumAction(item: SongModelViewModel) -> ((UIAlertAction) -> Void)? {
        return { _ in }
    }
    */
    private func playVideoAction(_ item: SongModelViewModel) -> ((UIAlertAction) -> Void)? {
        return { _ in

            let imageView = UIImageView(image: Res.image.song)
            imageView.contentMode = .scaleAspectFit

            let player = AVPlayer(url: item.previewUrl)
            self.playerController.contentOverlayView?.addSubview(imageView)
            self.playerController.player = player
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(self.playerDidFinishPlaying),
                name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                object: player.currentItem
            )
            imageView.fullSuperview()

            self.imageCache.setImage(
                imageView,
                url: item.artworkUrl100,
                placeholder: Res.image.song
            ) { (_, image, error) in
                if error != nil {
                    imageView.image = image
                }
            }
            self.viewController.present(self.playerController, animated: true) {
                self.playerController.player?.play()
            }
        }
    }
    @objc private func playerDidFinishPlaying(note: NSNotification) {
        self.playerController.dismiss(animated: true)
    }
    private func goAbumAction(_ url: URL) -> ((UIAlertAction) -> Void)? {
        return { _ in

        }
    }
}
