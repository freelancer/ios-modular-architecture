//
//  ViewController.swift
//  App
//
//  Created by Cyril Cermak on 20/2/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import UIKit
import CCComponents
import CCCore
import SnapKit
import RxSwift
import RxCocoa

protocol MainVCDelegate: class {
	func presentCCFeature0()
	func pushCCFeature1()
	func pushCCFeature2()
}

class MainVC: CCBaseVC {
	
	weak var delegate: MainVCDelegate?
	let disposeBag = DisposeBag()
	let mainView = MainView(frame: CGRect.zero)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initView()
		setBtns()
	}
	
	override func loadView() {
		self.view = UIView(frame: UIScreen.main.bounds)
	}
	
	private func initView() {
		self.view.addSubview(mainView)
		mainView.snp.makeConstraints({ $0.edges.equalTo(self.view) })
	}
	
	private func setBtns() {
		mainView.feature0Btn.rx.tap.subscribe(onNext: { self.delegate?.presentCCFeature0() }).disposed(by: disposeBag)
		mainView.feature1Btn.rx.tap.subscribe(onNext: { self.delegate?.pushCCFeature1() }).disposed(by: disposeBag)
		mainView.feature2Btn.rx.tap.subscribe(onNext: { self.delegate?.pushCCFeature2() }).disposed(by: disposeBag)
	}
	
}

