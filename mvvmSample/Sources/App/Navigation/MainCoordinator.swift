//
//  MainCoordinator.swift
//  mvvmSample
//
//  Created by Lauriane Haydari on 13/03/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

final class MainCoordinator: NSObject, UITabBarControllerDelegate {

    // MARK: - Properties

    private let presenter: UIWindow

    private let tabBarController: UITabBarController

    private let screens: Screens

    private let context: Context

    private let stack: CoreDataStack

    private var tabBarSource: TabBarSourceType = TabBarSource()

    private var firstCoordinator: FirstCoordinator?

    private var secondCoordinator: SecondCoordinator?

    // MARK: - Init

    init(presenter: UIWindow, context: Context, stack: CoreDataStack) {
        self.presenter = presenter
        self.context = context
        self.stack = stack
        self.screens = Screens(context: context, stack: stack)

        tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = tabBarSource.items
        tabBarController.selectedViewController = tabBarSource[.firstItem]

        super.init()

        tabBarController.delegate = self
    }

    func start() {
        presenter.rootViewController = tabBarController
        showMainView()
    }

    private func showMainView() {
        firstCoordinator = FirstCoordinator(presenter: tabBarSource[.firstItem], screens: screens)
        firstCoordinator?.start()
    }

    private func showSecondView() {
        secondCoordinator = SecondCoordinator(presenter: tabBarSource[.secondItem], screens: screens)
        secondCoordinator?.start()
    }
}

extension MainCoordinator {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let index = tabBarController.selectedIndex
        guard index < tabBarSource.items.count, let item = ViewControllerItem(rawValue: index) else {
            fatalError("Selected ViewController Index Out Of range")
        }

        switch item {
        case .firstItem:
            showMainView()
        case .secondItem:
            showSecondView()
        }
    }
}

