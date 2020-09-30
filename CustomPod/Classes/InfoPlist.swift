//
//  InfoPlist.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 24/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Foundation

struct InfoPlist {
    static let infoPlistDictionary = Bundle.main.infoDictionary
    
    enum InfoPlistKey: String {
        case shortVersion = "CFBundleShortVersionString"
        case version = "CFBundleVersion"
    }
    
    static func getValue(for key: InfoPlistKey) -> String? {
        guard let plistDict = infoPlistDictionary else {
            return nil
        }
        guard let value = plistDict[key.rawValue] as? String else {
            return nil
        }
        return value
    }
}
