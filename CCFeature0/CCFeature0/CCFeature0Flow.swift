//
//  CCFeature0Flow.swift
//  CCFeature0
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import CCCore

public class CCFeature0Flow: Flow, MainF0VCDelegate {
	
	public var finish: (Flow) -> () = { _ in }
	public var services: Services
	public var navigation: UINavigationController?
	
	public required init(services: Services, navigationVC: UINavigationController?) {
		self.services = services
		self.navigation = navigationVC
	}
	
	public func start() {
		presentFeature0()
	}
	
	private func presentFeature0() {
		let vc = MainF0VC(services: self.services)
		vc.delegate = self
		let vcNav = UINavigationController(rootViewController: vc)
		self.navigation?.present(vcNav, animated: true, completion: nil)
	}
	
	func wantsToClose(at vc: MainF0VC) {
		vc.dismiss(animated: true, completion: nil)
		finish(self)
	}
}
