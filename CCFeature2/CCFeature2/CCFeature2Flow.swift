//
//  CCFeature1Flow.swift
//  CCFeature1
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import CCCore

public class CCFeature2Flow: Flow {
	
	public var finish: (Flow) -> () = { _ in }
	public var services: Services
	public var navigation: UINavigationController?
	
	public required init(services: Services, navigationVC: UINavigationController?) {
		self.services = services
		self.navigation = navigationVC
	}
	
	public func start() {
		presentFeature2()
	}
	
	private func presentFeature2() {
		let vc = MainF2VC(services: self.services)
		vc.delegate = self
		self.navigation?.pushViewController(vc, animated: true)
	}
}

extension CCFeature2Flow: MainF2VCDelegate {
	func wantsToGoBack(at vc: MainF2VC) {
		finish(self)
	}
	
	func wantsToPresent(at vc: MainF2VC) {
		let modalVC = ModalFeatureVC(services: self.services)
		modalVC.delegate = self
		self.navigation?.present(UINavigationController(rootViewController: modalVC), animated: true, completion: nil)
	}
}

extension CCFeature2Flow: ModalFeatureVCDelegate {
	func wantsToClose(at vc: ModalFeatureVC) {
		vc.dismiss(animated: true, completion: nil)
	}
}
