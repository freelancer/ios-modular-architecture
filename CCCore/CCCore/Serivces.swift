//
//  Serivces.swift
//  App
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation

public protocol Services {
	var projectsProvider: ProductsProvider! { get }
	var usersProvider: UsersProvider! { get }
}

public struct CCServices: Services {
	public var projectsProvider: ProductsProvider!
	public var usersProvider: UsersProvider!
	
	public init() {
		self.projectsProvider = CCProductsProvider()
		self.usersProvider = CCUsersProvider()
	}
}
