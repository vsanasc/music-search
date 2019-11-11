//
//  SongListViewController.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit
import MusicSearchKit
import RxSwift

public class SongListViewController: UIViewController {

    // MARK: - Dependencies
    private let viewModel: SongListViewModel
    private let imageCache: ImageCache

    // MARK: - User interface
    private var userInterface: SongListUserInterface!

    // MARK: - Parameters
    private let searchController = UISearchController(searchResultsController: nil)
    private let disposeBag = DisposeBag()

    // MARK: - Initialize
    public init(
        songListViewModelFactory: SongListViewModelFactory,
        imageCache: ImageCache
    ) {
        self.viewModel = songListViewModelFactory.makeSongListViewModel()
        self.imageCache = imageCache
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setNavigator()
        loadData()
        subscribeInteractions()
    }
    public override func loadView() {
        view = SongListRootView(viewModel: viewModel, imageCache: imageCache)
    }
    private func subscribeInteractions() {
        self.userInterface = SongListUserInterface(viewController: self, imageCache: imageCache)

        viewModel
            .interations
            .subscribe(onNext: { (interaction) in
                switch interaction {
                case .tappedOptions(let itemViewModel):
                    self.userInterface.showOptions(item: itemViewModel)
                case .goAlbum(_):
                    return
                }
            })
            .disposed(by: disposeBag)
    }
    private func loadData() {
        let search = searchController.searchBar.text ?? ""
        viewModel
            .loadSongs(search: search)
    }

    private func setNavigator() {
        // searchController.searchResultsUpdater = self.viewModel
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.title = "Songs"
    }

}

extension SongListViewController: UISearchBarDelegate {
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        loadData()
    }
}

public protocol SongListViewModelFactory {
    func makeSongListViewModel() -> SongListViewModel
}
