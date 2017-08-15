//
//  ErrorPopover.swift
//  AudioBooks
//
//  Created by Carlos Roig on 15/08/2017.
//  Copyright © 2017 CRS. All rights reserved.
//

import Foundation
import UIKit

protocol ErrorPresenter {
    func presentError()
}

extension ErrorPresenter where Self: UIViewController {
    func presentError() {
        let alertController = UIAlertController.init(title: "Error", message: "Something went wrong", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Accept", style: .cancel, handler: { (action: UIAlertAction!) in
        })
        alertController.addAction(action)
        self.present(alertController, animated: true) {}
    }
}
