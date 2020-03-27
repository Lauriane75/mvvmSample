//
//  Repository.swift
//  mvvmSample
//
//  Created by Lauriane Haydari on 13/03/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import CoreData

protocol RepositoryType: class {

    // MARK: - Get from API


    // MARK: - Save in coredata


    // MARK: - Get from coredata


    // MARK: - Delete from coredata

}


final class Repository: RepositoryType {

    // MARK: - Properties

    private let client: HTTPClientType
    private let token = Token()
    private let stack: CoreDataStack

    // MARK: - Initializer

    init(client: HTTPClientType, stack: CoreDataStack) {
        self.client = client
        self.stack = stack
    }

    // MARK: - Get from API


    // MARK: - Save in coredata

    // MARK: - Get from coredata

    // MARK: - Delete from coredata

}
