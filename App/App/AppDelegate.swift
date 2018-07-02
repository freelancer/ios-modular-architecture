//
//  AppDelegate.swift
//  App
//
//  Created by Cyril Cermak on 20/2/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import UIKit
import CCCore


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var flow: AppFlow!
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		initFlowAndServices()
	
		if let documentsPathString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
			print(documentsPathString)
		}
		return true
	}
	
	//Creates a main flow for the app with services that are then passed to childFlows.
	private func initFlowAndServices() {
		let services = CCServices()
		self.flow = AppFlow(services: services)
		flow.start()
		self.window = UIWindow()
		self.window?.rootViewController = flow.rootNavigation
		self.window?.makeKeyAndVisible()
	}
	
}

