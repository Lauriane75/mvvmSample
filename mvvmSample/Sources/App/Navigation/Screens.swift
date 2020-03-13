//
//  Screens.swift
//  mvvmSample
//
//  Created by Lauriane Haydari on 13/03/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class Screens {

    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))

    private let context: Context
    private let stack: CoreDataStack

    init(context: Context, stack: CoreDataStack) {
        self.context = context
        self.stack = stack
    }
}

// MARK: - Main

extension Screens {
    func createFirstViewController(delegate: FirstViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "FirstViewController") as! FirstViewController
        let repository = Repository(client: context.client,
                                           stack: stack)
        let viewModel = FirstViewModel(repository: repository,
                                         delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Select City

extension Screens {
    func createSecondViewController(delegate: SecondViewModelDelegate?) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "SecondViewController") as! SecondViewController
        let repository = Repository(client: context.client,
        stack: stack)
        let viewModel = SecondViewModel(repository: repository, delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - Alert

extension Screens {
    func createAlertView(for type: AlertType) -> UIAlertController {
        let alert = Alert(type: type)
        let alertViewController = UIAlertController(title: alert.title,
                                                    message: alert.message,
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        return alertViewController
    }
}

