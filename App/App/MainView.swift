//
//  MainView.swift
//  App
//
//  Created by Cyril Cermak on 6/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import UIKit
import CCComponents

class MainView: UIView {
	
	let feature0Btn = CCBaseButton(frame: CGRect.zero)
	let feature1Btn = CCBaseButton(frame: CGRect.zero)
	let feature2Btn = CCBaseButton(frame: CGRect.zero)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		initView()
		setButtons()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	private func initView() {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .equalSpacing
		for btn in [feature0Btn, feature1Btn, feature2Btn] {
			btn.setTitleColor(.red, for: .normal)
			stackView.addArrangedSubview(btn)
		}
		
		self.addSubview(stackView)
		stackView.snp.makeConstraints { (make) in
			make.left.right.equalTo(self)
			make.center.equalTo(self)
			make.height.equalTo(150)
		}
	}
	
	private func setButtons() {
		feature0Btn.setTitle("present feature 0", for: .normal)
		feature1Btn.setTitle("push feature 1", for: .normal)
		feature2Btn.setTitle("push feature 2", for: .normal)
	}
	
}
