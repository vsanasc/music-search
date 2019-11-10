//
//  SongListViewModel.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import Foundation
import RxSwift
import PromiseKit

public class SongListViewModel {

    // MARK: - Dependecies
    private let repository: SongListRemoteAPI

    // MARK: - Messages
    public var errorMessages: Observable<ErrorMessage> {
        return errorMessagesSubject.asObservable()
    }
    private let errorMessagesSubject = PublishSubject<ErrorMessage>()

    // MARK: - Data
    public var dataList: Observable<[SongModelViewModel]> {
        return dataListSubject.asObserver()
    }
    private let dataListSubject = PublishSubject<[SongModelViewModel]>()

    // MARK: - Initialize
    public init(repository: SongListRemoteAPI) {
        self.repository = repository
    }

    public func loadSongs(search: String) {
        repository
            .getSongs(search: search)
            .done { [weak self] items in
                var elements = [SongModelViewModel]()
                for item in items {
                    elements.append(SongModelViewModel(songModel: item))
                }
                self?.dataListSubject.onNext(elements)
            }
            .catch { [weak self] error in
                print("\(error)")
                let error = ErrorMessage()
                self?.errorMessagesSubject.onNext(error)
            }
    }

}
