//
//  CameraSwapButton.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import UIKit

class CameraSwapButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.setImage(ImageConstants.cameraFront.getUIImage(), for: .normal)
        self.setImage(ImageConstants.cameraBack.getUIImage(), for: .selected)
    }
}
