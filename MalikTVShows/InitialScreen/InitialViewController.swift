//
//  ViewController.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    var presenter: InitialViewPresentation?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension InitialViewController: InitialViewInterface {
    @IBAction func goButtonClicked(_ sender: UIButton) {
        self.presenter?.openTVShowListScreen();
    }
}

