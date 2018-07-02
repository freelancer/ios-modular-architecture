//
//  MainFeature1.swift
//  CCFeature1
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import SnapKit
import RxSwift
import RxCocoa
import CCComponents
import CCCore

protocol MainF2VCDelegate: class {
	func wantsToGoBack(at vc: MainF2VC)
	func wantsToPresent(at vc: MainF2VC)
}

class MainF2VC: CCBaseVC {
	
	weak var delegate: MainF2VCDelegate?
	
	let disposeBag = DisposeBag()
	let presentMeBtn = CCBaseButton()
	let label = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initView()
	}
	
	override func loadView() {
		self.view = UIView()
		self.view.backgroundColor = .yellow
	}
	
	private func initView() {
		label.text = "CCFeature2"
		label.textAlignment = .center
		self.view.addSubview(label)
		label.snp.makeConstraints { (make) in
			make.width.equalTo(150)
			make.height.equalTo(30)
			make.center.equalTo(self.view)
		}
		
		self.view.addSubview(presentMeBtn)
		presentMeBtn.setTitle("Present Me!", for: .normal)
		presentMeBtn.rx.tap.subscribe(onNext: { [weak self] _ in
			guard let `self` = self else { return }
			self.delegate?.wantsToPresent(at: self)
			
		} ).disposed(by: disposeBag)
		presentMeBtn.snp.makeConstraints { (make) in
			make.width.height.equalTo(label)
			make.centerX.equalTo(label)
			make.top.equalTo(label.snp.bottom).offset(10)
		}
		
	}
	
	override func didMove(toParentViewController parent: UIViewController?) {
		if parent == nil {
			self.delegate?.wantsToGoBack(at: self)
		}
	}
	
}
