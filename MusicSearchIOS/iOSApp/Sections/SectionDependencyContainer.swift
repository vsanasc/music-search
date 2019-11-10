//
//  SectionDependecyContainer.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//
import MusicSearchKit

public class SectionDependencyContainer {
    // MARK: - Shared Dependencies
    private let sharedManagerRequestAPI: ManagerRequestAPI
    private let sharedImageCache: ImageCache

    // MARK: - Repositories
    private let songListRemoteAPI: SongListRemoteAPI

    public init(appDependency: MusicSearchAppDependencyContainer) {
        self.sharedManagerRequestAPI = appDependency.sharedManagerRequestAPI
        self.sharedImageCache = appDependency.sharedImageCache
        self.songListRemoteAPI = SongListAPI(manager: appDependency.sharedManagerRequestAPI)
    }

    public func makeSongListViewController() -> SongListViewController {
        return SongListViewController(songListViewModelFactory: self, imageCache: sharedImageCache)
    }
}

extension SectionDependencyContainer: SongListViewModelFactory {
    public func makeSongListViewModel() -> SongListViewModel {
        return SongListViewModel(repository: songListRemoteAPI)
    }
}
