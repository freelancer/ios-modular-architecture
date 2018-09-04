//
//  MainF0VC.swift
//  CCFeature0
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import SnapKit
import CCCore

protocol MainF0VCDelegate: class {
	func wantsToClose(at vc: MainF0VC)
}

class MainF0VC: CCBaseVC {
	
	weak var delegate: MainF0VCDelegate?
	
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
		label.text = "CCFeature0"
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
