//
//  MainFeature1.swift
//  CCFeature1
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import SnapKit
import SkyFloatingLabelTextField
import CCCore

protocol MainF1VCDelegate: class {
	func wantsToGoBack(at vc: MainF1VC)
}

class MainF1VC: CCBaseVC {
	
	weak var delegate: MainF1VCDelegate?
	let textfield = SkyFloatingLabelTextField()
	let label = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initView()
	}
	
	override func loadView() {
		self.view = UIView()
		self.view.backgroundColor = .blue
	}
	
	private func initView() {
		let label = UILabel()
		label.text = "CCFeature1"
		label.textAlignment = .left
		self.view.addSubview(label)
		label.snp.makeConstraints { (make) in
			make.width.equalTo(150)
			make.height.equalTo(30)
			make.center.equalTo(self.view)
		}
		
		self.view.addSubview(textfield)
		textfield.snp.makeConstraints { (make) in
			make.width.height.equalTo(label)
			make.top.equalTo(label.snp.bottom).offset(10)
			make.centerX.equalTo(label)
		}
	}
	
	@objc func didClickClose() {
		delegate?.wantsToGoBack(at: self)
	}
	
	override func didMove(toParentViewController parent: UIViewController?) {
		if parent == nil {
			self.delegate?.wantsToGoBack(at: self)
		}
	}
	
}
