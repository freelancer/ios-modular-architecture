//
//  Flow.swift
//  CCCore
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation

/**
	Every child flow must implement Flow protocol
	- func start: Starts the flow process, it usually decides what is going to be presented
	- var services: Property that contains all the services that are being used in the app
	- var finish: Is a closure that notifies parent Flow that the child flow is finished.
	- var currentVC: Returns view controller that is currently being displayed
*/
public protocol Flow {
	init(services: Services, navigationVC: UINavigationController?)
	func start()
	var services: Services { get }
	var finish: (_ flow: Flow) -> () { get set }
	var navigation: UINavigationController? { get set }
	var currentVC: UIViewController?  { get }
}

extension Flow {
	public var currentVC: UIViewController? {
		return navigation?.viewControllers.last
	}
}
