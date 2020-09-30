//
//  MicButton.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import UIKit

class MicButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.setImage(ImageConstants.micUnmuted.getUIImage(), for: .normal)
        self.setImage(ImageConstants.micMuted.getUIImage(), for: .selected)
    }
}
