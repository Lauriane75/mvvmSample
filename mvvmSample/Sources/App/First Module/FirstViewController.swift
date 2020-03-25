//
//  FirstViewController.swift
//  mvvmSample
//
//  Created by Lauriane Haydari on 13/03/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - Outlet

    @IBOutlet weak var label: UILabel!

    // MARK: - Properties

    var viewModel: FirstViewModel!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBarCustom()

        bind(to: viewModel)

        viewModel.viewDidLoad()
    }

    private func bind(to viewModel: FirstViewModel) {
        viewModel.labelText = { [weak self] text in
            self?.label.text = text
        }
    }

    // MARK: - View actions


    // MARK: - Private Files

    fileprivate func navigationBarCustom() {
        guard let bar = navigationController?.navigationBar else { return }
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red,
                              NSAttributedString.Key.font: UIFont(name: "kailasa", size: 20)]
        bar.titleTextAttributes = textAttributes as [NSAttributedString.Key: Any]
        viewModel.navBarTitle = { text in
            self.navigationItem.title = text
        }
    }
}
