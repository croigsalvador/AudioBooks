//
//  AudioBooksViewController.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import UIKit

class AudioBooksContainerViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var viewControllers = [UIViewController]()
    
    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        super.init(nibName:"AudioBooksContainerViewController", bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AudioBookRiverCollectionViewCell.self)
        collectionView.reloadData()
    }
}

extension AudioBooksContainerViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : AudioBookRiverCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        addChild(viewController: viewControllers[indexPath.item], toView: cell.containerView)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewControllers[indexPath.item].removeFromParent()
    }
}

extension AudioBooksContainerViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width:collectionView.frame.size.width, height:230.0)
    }
}
