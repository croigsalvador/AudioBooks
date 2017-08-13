//
//  CollectionView.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView { static var reuseIdentifier: String {get} }
extension ReusableView where Self: UIView { static var reuseIdentifier: String { return String(describing:self)} }
protocol NibLoadableView: class { static var nibName: String { get } }
extension NibLoadableView where Self: UIView {
    static var nibName: String { return String(describing:self) }
}

extension UICollectionReusableView: ReusableView, NibLoadableView {}

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UICollectionReusableView>(_: T.Type, kind: String) where T: ReusableView, T: NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier:T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueSuplementaryView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath, kind: String) -> T where T: ReusableView {
        guard let suppView = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue supplementary view with identifier: \(T.reuseIdentifier)")
        }
        return suppView
    }
}
