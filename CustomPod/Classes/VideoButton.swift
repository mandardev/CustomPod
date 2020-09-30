//
//  videoButton.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import UIKit

class VideoButton: UIButton {

//    @IBInspectable var titleText: String? {
//        didSet {
//            self.setTitle(titleText, for: .normal)
//            self.setTitleColor(UIColor.black,for: .normal)
//        }
//    }

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
        self.setImage(ImageConstants.videoUnmuted.getUIImage(), for: .normal)
        self.setImage(ImageConstants.videoMuted.getUIImage(), for: .selected)
    }
}
