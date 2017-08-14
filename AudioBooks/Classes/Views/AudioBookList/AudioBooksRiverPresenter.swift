//
//  AudioBooksRiverPresenter.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

protocol AudioBooksRiverView: class {
    
}

class AudioBooksRiverPresenter: Presenter, DataSource {
    
    weak var view: (AudioBooksRiverView & CollectionNotifier)?
    private let obtainAudioBookList: ObtainAudioBookList
    private var audioBookCellViewModels = [AudioBookViewModel]()
    
    init(obtainAudioBookList: ObtainAudioBookList) {
        self.obtainAudioBookList = obtainAudioBookList
    }
    
    func viewDidLoad() {
        DispatchQueue.global(qos: .default).async {
            self.obtainAudioBookList.obtainaAudioBookList { (audiosBooks) in
                self.audioBookCellViewModels = audiosBooks
                DispatchQueue.main.async {
                    self.view?.reloadData()
                }
            }
        }
    }
    
    func numberOfItems(in section: Int) -> Int {
        return audioBookCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CellViewModel {
        return audioBookCellViewModels[indexPath.item]
    }
}
