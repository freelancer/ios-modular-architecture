//
//  UsersProvider.swift
//  CCCore
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation

public protocol UsersProvider {
	func getUsers()
	func getUser(with id: Int)
}

public struct CCUsersProvider: UsersProvider {
	public func getUsers() {
		//Implement the functionality
	}
	public func getUser(with id: Int) {
		//Implement the functionality
	}
}
