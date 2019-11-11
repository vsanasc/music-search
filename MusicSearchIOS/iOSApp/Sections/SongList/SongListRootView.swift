//
//  SongListRootView.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit
import MusicSearchKit
import RxSwift

public class SongListRootView: UIView {

    // MARK: - Dependencies
    private let viewModel: SongListViewModel
    private let imageCache: ImageCache

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(SongListItemCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    private let disposeBag = DisposeBag()
    private var items = [SongModelViewModel]()

    public init(viewModel: SongListViewModel, imageCache: ImageCache) {
        self.viewModel = viewModel
        self.imageCache = imageCache
        super.init(frame: .zero)
        subscribeData()
        setupView()
    }
    private func setupView() {
        backgroundColor = .white
        addSubviews(tableView)
        tableView.fullSuperview()
    }
    private func subscribeData() {
        viewModel
            .dataList
            .subscribe(
                onNext: { [weak self] (items) in
                    guard let strongSelf = self else {
                        return
                    }
                    strongSelf.items = items
                    strongSelf.tableView.reloadData()
                }
            )
            .disposed(by: disposeBag)

    }

    required init?(coder: NSCoder) {
        return nil
    }
}

extension SongListRootView: UITableViewDelegate, UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elem = items[indexPath.row]

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? SongListItemCell
        cell!.displayData(elem, imageCache: imageCache)
        cell!.indexPath = indexPath
        cell!.delegate = self
        return cell!
    }
}

extension SongListRootView: SongListTapOptionsDelegate {
    func tapped(_ indexPath: IndexPath) {
        let action: SongListInteraction = .tappedOptions(items[indexPath.row])
        viewModel
            .interaction(action: action)
    }
}
