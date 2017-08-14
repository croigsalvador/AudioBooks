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
    
    fileprivate let presenter: AudioBooksRiverPresenter
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    init(presenter: AudioBooksRiverPresenter) {
        self.presenter = presenter
        super.init(nibName:"AudioBooksRiverViewController", bundle:nil)
        self.presenter.view = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
    }
}

extension AudioBooksRiverViewController: AudioBooksRiverView {
    
}

extension AudioBooksRiverViewController: CollectionNotifier {
    func reloadData() {
        collectionView.reloadData()
    }
}

extension AudioBooksRiverViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
}
