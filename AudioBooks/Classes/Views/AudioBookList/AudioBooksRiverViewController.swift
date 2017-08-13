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
    }
}

extension AudioBooksRiverViewController: AudioBooksRiverView {
    
    func displayLoading() {
        print("Loading")
    }
}
