//
//  AudioBookRiverHeaderView.swift
//  AudioBooks
//
//  Created by Carlos Roig on 14/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import UIKit

class AudioBookRiverHeaderView: UICollectionReusableView {

    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(with viewModel: RiverHeaderViewModel) {
        titleLabel.text = viewModel.title
    }
    
}
