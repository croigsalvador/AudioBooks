//
//  AudioBooksRiverPresenter.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation

protocol AudioBooksRiverView {
    func displayLoading()
}

class AudioBooksRiverPresenter: Presenter {

    private let obtainAudioBookList: ObtainAudioBookList
    
    init(obtainAudioBookList: ObtainAudioBookList) {
        self.obtainAudioBookList = obtainAudioBookList
    }
    
    func viewDidLoad() {
        obtainAudioBookList.obtainaAudioBookList { (audiosBooks) in
            print(audiosBooks)
        }
    }
}
