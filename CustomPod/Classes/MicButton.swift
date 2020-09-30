//
//  MicButton.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import UIKit

public class MicButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    public func setup() {
        self.setImage(OUImageConstants.micUnmuted.getUIImage(), for: .normal)
        self.setImage(OUImageConstants.micMuted.getUIImage(), for: .selected)
    }
}
