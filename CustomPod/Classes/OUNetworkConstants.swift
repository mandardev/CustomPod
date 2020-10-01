//
//  OUNetworkConstants.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 24/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Foundation

struct OUNetworkConstants {

    // All API's base URL
    #if PROD
        static var baseUrl = "" // TODO:- Update PROD url.
    #else
        static var baseUrl = ""
    #endif
    
    //The header fields
    enum HttpHeaderField: String {
        case acceptLanguage = "Accept-Language"
        case authorization = "Authorization"
        case deviceId = "Device-Id"
        case deviceType = "Device-Type"
        case appVersion = "App-Version"
        case deviceIdTimestamp = "Device-Id-Timestamp"
        case deviceToken = "Device-Token"
        case timeZone = "TimeZone"
        case contentType = "Content-Type"
        
    }

    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
    
    enum AWS: String {
        case bucketName = ""
        case key = ""
    }
}

