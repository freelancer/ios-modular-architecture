//
//  CCFeature1Flow.swift
//  CCFeature1
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import CCCore

public class CCFeature1Flow: Flow, MainF1VCDelegate {
	
	public var finish: (Flow) -> () = { _ in }
	public var services: Services
	public var navigation: UINavigationController?
	
	public required init(services: Services, navigationVC: UINavigationController?) {
		self.services = services
		self.navigation = navigationVC
	}
	
	public func start() {
		presentFeature1()
	}
	
	private func presentFeature1() {
		let vc = MainF1VC(services: self.services)
		vc.delegate = self
		self.navigation?.pushViewController(vc, animated: true)
	}
	
	func wantsToGoBack(at vc: MainF1VC) {
		vc.dismiss(animated: true, completion: nil)
		finish(self)
	}
	
}
