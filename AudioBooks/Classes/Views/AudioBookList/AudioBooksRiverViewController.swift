//
//  AudioBooksRiverViewController.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation
import UIKit

class AudioBooksRiverViewController: UIViewController, ErrorPresenter {
    
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var loaderContainer: UIView!
    @IBOutlet fileprivate weak var reloadButton: UIButton!
    @IBOutlet fileprivate weak var riverTitleLabel: UILabel!
    @IBOutlet fileprivate weak var collectionView: UICollectionView!

    fileprivate let presenter: AudioBooksRiverPresenter
    
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
        collectionView.delegate = self
        collectionView.register(AudioBookCollectionViewCell.self)
    }
    
    @IBAction func reloadButtonPressed(_ sender: Any) {
        presenter.loadItems()
        reloadButton.isHidden = true
    }
}

extension AudioBooksRiverViewController: AudioBooksRiverView {
    
    func displayLoader() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func updateRiver(with title: String) {
        riverTitleLabel.text = title
    }
    
    func displayError() {
        presentError()
    }
    
    func showReload() {
        reloadButton.layoutIfNeeded()
        reloadButton.isHidden = false
    }
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
        let cell : AudioBookCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(with: presenter.cellViewModel(at: indexPath) as! AudioBookViewModel)
        return cell
    }
}

extension AudioBooksRiverViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 6.0, bottom: 6.0, right: 6.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width:150.0, height:180.0  )
    }
}

