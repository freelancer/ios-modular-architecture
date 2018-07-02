//
//  CCBaseVC.swift
//  CCComponents
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import UIKit

open class CCBaseVC: UIViewController {
	
	var services: Services!
	
	public convenience init(services: Services) {
		self.init(nibName: nil, bundle: nil)
		self.services = services
	}
	
	override open func viewDidLoad() {
		super.viewDidLoad()
		print("Did load \(self.classForCoder)")
	}
	
	deinit {
		print("Did deinit \(self.classForCoder)")
	}
	
}
