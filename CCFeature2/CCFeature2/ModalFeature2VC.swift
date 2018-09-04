//
//  MainF0VC.swift
//  CCFeature0
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import CCCore
import SnapKit

protocol ModalFeatureVCDelegate: class {
	func wantsToClose(at vc: ModalFeatureVC)
}

class ModalFeatureVC: CCBaseVC {
	
	weak var delegate: ModalFeatureVCDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initView()
	}
	
	override func loadView() {
		self.view = UIView()
		self.view.backgroundColor = .red
	}
	
	private func initView() {
		let label = UILabel()
		label.text = "Modal"
		label.textAlignment = .center
		self.view.addSubview(label)
		label.snp.makeConstraints { (make) in
			make.width.equalTo(150)
			make.height.equalTo(30)
			make.center.equalTo(self.view)
		}
		let rightBarButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(self.didClickClose))
		self.navigationItem.rightBarButtonItem = rightBarButton
	}
	
	@objc func didClickClose() {
		delegate?.wantsToClose(at: self)
	}
	
}
