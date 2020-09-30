//
//  Device.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 24/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Device Structure
struct Device {
    // MARK: - International Checks
    static var CurrentRegion: String {
        return ((Locale.current as NSLocale).object(forKey: .countryCode) as? String)!
    }
    
    // MARK: - Current device object
    static let currentDevice = UIDevice.current
    
    // MARK: - Device Idiom Checks
    enum SupportedInterfaceType: String {
        case iPhone = "iPhone"
        case iPad = "iPad"
        case unspecified = "Unspecified"
    }
    
    static var deviceInterfaceType: SupportedInterfaceType {
        if isPhone() {
            return SupportedInterfaceType.iPhone
        } else if isPad() {
            return SupportedInterfaceType.iPad
        }
        
        return SupportedInterfaceType.unspecified
    }
    
    //swiftlint:disable number_separator
    static var hasNotch: Bool {
        if isPhone() {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                return false
            case 1334:
                print("iPhone 6/6S/7/8")
                return false
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                return false
            case 2436:
                print("iPhone X/XS/11 Pro")
                return true
            case 2688:
                print("iPhone XS Max/11 Pro Max")
                return true
            case 1792:
                print("iPhone XR/ 11 ")
                return true
            default:
                print("Unknown")
                return false
            }
        }
        return false
    }
    //swiftlint:enable number_separator
    
    static func isPhone() -> Bool {
        return currentDevice.userInterfaceIdiom == .phone
    }

    static func isPad() -> Bool {
        return currentDevice.userInterfaceIdiom == .pad
    }
    
    static func deviceId() -> String {
        UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
}
