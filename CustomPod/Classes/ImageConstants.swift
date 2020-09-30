//
//  ImageConstants.swift
//  CustomPod
//
//  Created by Mandar Choudhary on 28/09/20.
//  Copyright © 2020 Mandar Choudhary. All rights reserved.
//

import Foundation
import UIKit

enum ImageConstants: String {
    case cameraFront = "camera_front"
    case cameraBack = "camera_back"
    case videoUnmuted = "video_unmuted"
    case videoMuted = "video_muted"
    case micUnmuted = "mic_unmuted"
    case micMuted = "mic_muted"
    case decline = "decline"
    case docIcon = "doc_icon"
    case screenShot = "screenshot_icon"
}

extension ImageConstants {
    
    public static var cameraFront1: UIImage {
        let bundle = Bundle(for: VideoCallController.self)
        return UIImage(named: "camera_front", in: bundle, compatibleWith: nil)!
    }
    
    public static var videoUnmuted1: UIImage {
        let bundle = Bundle(for: VideoCallController.self)
        return UIImage(named: "video_unmuted", in: bundle, compatibleWith: nil)!
    }
    
    public static var cameraBack1: UIImage {
        let bundle = Bundle(for: VideoCallController.self)
        return UIImage(named: "camera_back", in: bundle, compatibleWith: nil)!
    }
    
    public static var videoMuted1: UIImage {
        let bundle = Bundle(for: VideoCallController.self)
        return UIImage(named: "video_muted", in: bundle, compatibleWith: nil)!
    }
    
    public static var micUnmuted1: UIImage {
        let bundle = Bundle(for: VideoCallController.self)
        return UIImage(named: "mic_unmuted", in: bundle, compatibleWith: nil)!
    }
    
    public static var micMuted1: UIImage {
        let bundle = Bundle(for: VideoCallController.self)
        return UIImage(named: "mic_muted", in: bundle, compatibleWith: nil)!
    }
    
    public static var decline1: UIImage {
        let bundle = Bundle(for: VideoCallController.self)
        return UIImage(named: "decline", in: bundle, compatibleWith: nil)!
    }
    
    public static var screenShot1: UIImage {
        let bundle = Bundle(for: VideoCallController.self)
        return UIImage(named: "screenshot_icon", in: bundle, compatibleWith: nil)!
    }
    
    func getUIImage() -> UIImage {
//        UIImage.init(named: self.rawValue) ?? UIImage()
//
//
//        return UIImage(named:"IMG_0745", bundle:Bundle(for: self), compatibleWith:nil)
        UIImage(named: self.rawValue, in:Bundle(identifier: "com.mandar.custompod.CustomPod"), compatibleWith: nil) ?? UIImage()

//        let bundle = Bundle(for: VideoCallController.self)
//        return UIImage(named: self.rawValue, in: bundle, compatibleWith: nil)!
    }
}

