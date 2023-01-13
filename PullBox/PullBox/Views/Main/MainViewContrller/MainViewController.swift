//
//  MainViewController.swift
//  PullBox
//
//  Created by mingmac on 2023/01/06.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    private func layout() {
        let searchBar = SearchBar()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)

    }
}

