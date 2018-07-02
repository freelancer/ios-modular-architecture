//
//  AppFlow.swift
//  App
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import UIKit
/**
	This is the order of how the frameworks are being compiled.
	It starts with CCCore but if CCCore contains other imported framework
	then the compiler jumps to that framework.
*/
import CCCore
import CCFeature0
import CCFeature1
import CCFeature2


/**
	Init of the flow takes two params:
	@param services: An object that contains reference to all the services that are used in the app
	@param navigationVC: Main UINavigationVC who is then passed to a childFlows
*/
class AppFlow: Flow {
	
	var services: Services
	var childFlows: [Flow] = [Flow]()
	public var finish: (Flow) -> () = { _ in }
	var rootNavigation: UINavigationController!
	
	
	public var currentVC: UIViewController? {
		return rootNavigation.viewControllers.last 
	}
	
	required init(services: Services, navigationVC: UINavigationController? = nil) {
		self.services = services
		self.finish = { _ in }
	}
	
	public func start() {
		self.presentMain()
	}
	
	private func presentMain() {
		let mainVC = MainVC(services: self.services)
		mainVC.delegate = self
		self.rootNavigation = UINavigationController(rootViewController: mainVC)
	}
	
}

extension AppFlow: MainVCDelegate {
	func presentCCFeature0() {
		let flow = CCFeature0Flow(services: self.services, navigationVC: self.rootNavigation)
		flow.start()
		self.childFlows.append(flow)
		flow.finish = { flow in _ = self.childFlows.popLast() }
	}
	
	func pushCCFeature1() {
		let flow = CCFeature1Flow(services: self.services, navigationVC: self.rootNavigation)
		flow.start()
		self.childFlows.append(flow)
		flow.finish = { flow in _ = self.childFlows.popLast() }
	}
	
	func pushCCFeature2() {
		let flow = CCFeature2Flow(services: self.services, navigationVC: self.rootNavigation)
		flow.start()
		self.childFlows.append(flow)
		flow.finish = { flow in _ = self.childFlows.popLast() }
	}
	
}
