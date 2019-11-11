//
//  SongListViewModel.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import Foundation
import RxSwift
import PromiseKit

public enum SongListInteraction {
    case tappedOptions(SongModelViewModel)
    case goAlbum(SongModelViewModel)
}

public class SongListViewModel {

    // MARK: - Dependecies
    private let repository: SongListRemoteAPI

    // MARK: - Messages
    public var errorMessages: Observable<ErrorMessage> {
        return errorMessagesSubject.asObservable()
    }
    private let errorMessagesSubject = PublishSubject<ErrorMessage>()

    // MARK: - Interactions
    public var interations: Observable<SongListInteraction> {
        return interationsSubject.asObserver()
    }
    private let interationsSubject = PublishSubject<SongListInteraction>()

    // MARK: - Data
    public var dataList: Observable<[SongModelViewModel]> {
        return dataListSubject.asObserver()
    }
    private let dataListSubject = PublishSubject<[SongModelViewModel]>()

    // MARK: - Initialize
    public init(repository: SongListRemoteAPI) {
        self.repository = repository
    }
    public func interaction(action: SongListInteraction) {
        interationsSubject.onNext(action)
    }
    public func loadSongs(search: String) {
        repository
            .getSongs(search: search)
            .done { [weak self] items in
                let elements = items.map { SongModelViewModel(songModel: $0) }
                self?.dataListSubject.onNext(elements)
            }
            .catch { [weak self] error in
                print("\(error)")
                let error = ErrorMessage()
                self?.errorMessagesSubject.onNext(error)
            }
    }

}
