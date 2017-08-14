//
//  AudioBookCollectionViewCell.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import UIKit

class AudioBookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!

    func configure(with viewModel:AudioBookViewModel) {
        titleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
    }
}
