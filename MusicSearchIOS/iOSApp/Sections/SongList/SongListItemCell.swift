//
//  SongListItemCell.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit
import MusicSearchKit

class SongListItemCell: UITableViewCell {
    weak var delegate: SongListTapOptionsDelegate?
    let photo = BaseImageView()
    let title: UILabel = {
        let label = BaseLabel()
        label.font = label.font.withSize(14)
        return label
    }()
    let subtitle: UILabel = {
        let label = BaseLabel()
        label.textColor = Res.color.lightGray
        label.font = label.font.withSize(12)
        return label
    }()
    let body: UILabel = {
        let label = BaseLabel()
        label.textColor = Res.color.lightGray
        label.font = label.font.withSize(12)
        return label
    }()
    let options: UIButton = {
        let button = UIButton()
        button.setImage(Res.image.options, for: .normal)
        return button
    }()

    var indexPath: IndexPath?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        options.addTarget(self, action: #selector(optionAction), for: .touchUpInside)
        addSubviews(photo, title, subtitle, body, options)
        setConstraints()
    }

    func displayData(_ item: SongModelViewModel, imageCache: ImageCache) {
        title.text = item.trackName
        subtitle.text = "\(item.trackTimeMillis)"
        body.text = item.artistName
        imageCache.setImage(photo, url: item.artworkUrl100, placeholder: nil, completion: nil)
    }
    @objc func optionAction() {
        delegate?.tapped(indexPath!)
    }
    private func setConstraints() {
        let constraints: [NSLayoutConstraint] = [
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            photo.widthAnchor.constraint(equalToConstant: 65),
            photo.heightAnchor.constraint(greaterThanOrEqualToConstant: 65),

            title.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            title.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            subtitle.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            body.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 5),
            body.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            body.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            options.centerYAnchor.constraint(equalTo: centerYAnchor),
            options.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ]
        constraints.forEach { $0.isActive = true }
        NSLayoutConstraint.activate(constraints)
    }

    required init?(coder: NSCoder) {
        return nil
    }

}
