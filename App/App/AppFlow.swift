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
	var navigation: UINavigationController?
	var finish: (Flow) -> () = { _ in }
	
	required init(services: Services, navigationVC: UINavigationController? = nil) {
		self.services = services
	}
	
	public func start() {
		self.presentMainVC()
	}
	
	private func presentMainVC() {
		let mainVC = MainVC(services: self.services)
		mainVC.delegate = self
		self.navigation = UINavigationController(rootViewController: mainVC)
	}
	
}

extension AppFlow: MainVCDelegate {
	func presentCCFeature0() {
		let feature0Flow = CCFeature0Flow(services: self.services, navigationVC: self.navigation)
		feature0Flow.finish = { flow in
			_ = self.childFlows.popLast()
			print("poped CCFeature0Flow)")
		}
		startNew(flow: feature0Flow)
	}
	
	func pushCCFeature1() {
		let feature1Flow = CCFeature1Flow(services: self.services, navigationVC: self.navigation)
		feature1Flow.finish = { flow in
			_ = self.childFlows.popLast()
			print("poped CCFeature1Flow)")
		}
		startNew(flow: feature1Flow)
	}
	
	func pushCCFeature2() {
		let feature2Flow = CCFeature2Flow(services: self.services, navigationVC: self.navigation)
		feature2Flow.finish = { flow in
			_ = self.childFlows.popLast()
			print("poped CCFeature2Flow)")
		}
		startNew(flow: feature2Flow)
	}
	
	private func startNew(flow: Flow) {
		flow.start()
		self.childFlows.append(flow)
	}
	
}
