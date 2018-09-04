//
//  ProductsProvider.swift
//  CCCore
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation

public protocol ProductsProvider {
	func getProducts()
	func getProduct(with id: Int)
}

public struct CCProductsProvider: ProductsProvider {
	public func getProducts() {
		//Implement the functionality
	}
	
	public func getProduct(with id: Int) {
		//Implement the functionality
	}
}
