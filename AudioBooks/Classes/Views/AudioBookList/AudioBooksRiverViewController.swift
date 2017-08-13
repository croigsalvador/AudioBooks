//
//  AudioBooksRiverViewController.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation
import UIKit

class AudioBooksRiverViewController: UIViewController {
    
    private let presenter: AudioBooksRiverPresenter
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    init(presenter: AudioBooksRiverPresenter) {
        self.presenter = presenter
        super.init(nibName:"AudioBooksRiverViewController", bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionView.reloadData()
    }
}

extension AudioBooksRiverViewController: AudioBooksRiverView {
    
    func displayLoading() {
        print("Loading")
    }
}

extension AudioBooksRiverViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
}
