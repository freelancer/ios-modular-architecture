//
//  CCBaseButton.swift
//  CCComponents
//
//  Created by Cyril Cermak on 5/3/18.
//  Copyright © 2018 CyrilCermak. All rights reserved.
//

import Foundation
import UIKit

public class CCBaseButton: UIButton {
	
	public init() {
		super.init(frame: CGRect.zero)
		self.setTitleColor(.red, for: .normal)
	}
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
