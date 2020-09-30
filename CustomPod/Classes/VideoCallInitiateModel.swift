//
//  VideoCallInitiateModel.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 24/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Foundation
import ObjectMapper

struct VideoCallInitiateModel: Mappable {
    
    var code: Int = 0
    var data: VideoCallInitiateResponse?
    var message: String?
    var status: String?
    var error: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        data <- map["data"]
        message <- map["message"]
        status <- map["status"]
        error <- map["error"]
    }
}

struct VideoCallInitiateResponse: Mappable {
    
    var id: String?
    var sex: String?
    var dob: String?
    var countryCode: String?
    var token: String?

    init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        print(map.JSON)
        id <- map["id"]
        sex <- map["sex"]
        dob <- map["dob"]
        countryCode <- map["countryCode"]
        token <- map["token"]
    }
}
