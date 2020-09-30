//
//  SubscriberCollectionViewCell.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import UIKit
import OpenTok

class SubscriberCollectionViewCell: UICollectionViewCell {
    
    let muteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var subscriber: OTSubscriber?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        if let sub = subscriber, let subView = sub.view {
            subView.frame = bounds
            contentView.insertSubview(subView, belowSubview: muteButton)
            muteButton.isEnabled = true
            muteButton.isHidden = false
        }
    }
    
    func addViews() {
        
        self.addSubview(muteButton)
        muteButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        muteButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        muteButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        muteButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        muteButton.addTarget(self, action: #selector(muteButtonAction), for: .touchUpInside)
    }
    
    @objc func muteButtonAction() {
        
        subscriber?.subscribeToAudio = !(subscriber?.subscribeToAudio ?? true)
        let buttonImage: UIImage  = {
            if !(subscriber?.subscribeToAudio ?? true) {
                return ImageConstants.micUnmuted.getUIImage()
            } else {
                return ImageConstants.micMuted.getUIImage()
            }
        }()
        muteButton.setImage(buttonImage, for: .normal)
    }
}
