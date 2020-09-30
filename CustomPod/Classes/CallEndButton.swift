//
//  CallEndButton.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import UIKit

open class CallEndButton: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    open func setup() {
        self.setImage(OUImageConstants.decline.getUIImage(), for: .normal)
    }
}
