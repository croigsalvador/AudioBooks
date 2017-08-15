//
//  AudioBooksRiverPresenter.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

protocol AudioBooksRiverView: class {
    func displayLoader()
    func hideLoader()
    func updateRiver(with title: String)
    func displayError()
    func showReload()
}

class AudioBooksRiverPresenter: Presenter, DataSource {
    
    weak var view: (AudioBooksRiverView & CollectionNotifier)?
    private let obtainAudioBookList: ObtainAudioBookList
    private var audioBookCellViewModels = [AudioBookViewModel]()
    
    init(obtainAudioBookList: ObtainAudioBookList) {
        self.obtainAudioBookList = obtainAudioBookList
    }
    
    func viewDidLoad() {
        loadItems()
    }
    
    func loadItems() {
        view?.displayLoader()
        obtainAudioBookList.obtainaAudioBookList { (audiosBooks) in
            self.view?.hideLoader()
            if audiosBooks.count > 0 {
                self.audioBookCellViewModels = audiosBooks
                self.view?.reloadData()
            } else {
                self.view?.displayError()
                self.view?.showReload()
            }
        }
        
        view?.updateRiver(with: "Top AudioBooks")
    }
    
    func numberOfItems(in section: Int) -> Int {
        return audioBookCellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CellViewModel {
        return audioBookCellViewModels[indexPath.item]
    }
    
    func headerViewModel(at indexPath: IndexPath) -> HeaderViewModel {
        return RiverHeaderViewModel(title: "Top AudioBooks")
    }
}
