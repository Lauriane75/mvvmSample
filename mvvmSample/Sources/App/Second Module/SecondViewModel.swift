//
//  SecondViewModel.swift
//  mvvmSample
//
//  Created by Lauriane Haydari on 13/03/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol SecondViewModelDelegate: class {
    func displayAlert(for type: AlertType)
}

final class SecondViewModel {

    // MARK: - Properties

    private let repository: RepositoryType

    private weak var delegate: SecondViewModelDelegate?

    // MARK: - Initializer

    init(repository: RepositoryType, delegate: SecondViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Output

    var labelText: ((String) -> Void)?

    var navBarTitle: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        labelText?("This is the second view")
        navBarTitle?("Second")
    }

    // MARK: - Private Functions
}

