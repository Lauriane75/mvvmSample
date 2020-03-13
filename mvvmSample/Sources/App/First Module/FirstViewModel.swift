//
//  FirstViewModel.swift
//  mvvmSample
//
//  Created by Lauriane Haydari on 13/03/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import Foundation

protocol FirstViewModelDelegate: class {
    func displayAlert(for type: AlertType)
}

final class FirstViewModel {

    // MARK: - Properties

    private let repository: RepositoryType

    private weak var delegate: FirstViewModelDelegate?

    // MARK: - Initializer

    init(repository: RepositoryType, delegate: FirstViewModelDelegate?) {
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Output

    var labelText: ((String) -> Void)?

    var navBarTitle: ((String) -> Void)?

    // MARK: - Input

    func viewDidLoad() {
        labelText?("This is the first view")
        navBarTitle?("First")
    }

    // MARK: - Private Functions
}
