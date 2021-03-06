//
//  OUApiRouter.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 22/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Foundation
import Alamofire

enum OUApiRouter: URLRequestConvertible {
    
    case videoCallInitiate(VideoCallInitiateRequest)
    case videoCallEnd(VideoCallEndRequest)
    case videoCallCancel(VideoCallCancelRequest)

    // MARK: - Path
    /// The path is the part following the base url
    private var path: String {
        switch self {
        case .videoCallInitiate:
            return "/api/v1/appointment/video/call/initiate"
        case .videoCallEnd:
            return "/api/v1/appointment/video/call/end"
        case .videoCallCancel:
            return "/api/v1/appointment/video/call/cancel"
        }
    }

    // MARK: - HttpMethod
    /// This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        switch self {
        case .videoCallInitiate:
            return .post
        case .videoCallEnd,
             .videoCallCancel:
            return .get
        }
    }

    /// Encoding type respective to the API being executed. (URLEncoding || JSONEncoding)
    private var parameterEncoding: ParameterEncoding {
        switch self {
        case .videoCallInitiate:
            return JSONEncoding.default
        case .videoCallEnd, .videoCallCancel:
            return URLEncoding.default
        }
    }

    // MARK: - Parameters
    /// This is the queries part, it's optional because an endpoint can be without parameters
    private var parameters: Parameters? {
        switch self {
        case .videoCallInitiate(let request):
            //A dictionary of the key (From the constants file) and its value is returned
            return request.parameters()
        case .videoCallCancel(let request):
            return request.parameters()
        case .videoCallEnd(let request):
            return request.parameters()
        }
    }
}

// MARK: - URL Request
extension OUApiRouter {
    func asURLRequest() throws -> URLRequest {

        let url = try OUNetworkConstants.baseUrl.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        //Http method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.headers = getHttpHeaders()

        //Encoding
        let encoding = parameterEncoding

        return try encoding.encode(urlRequest, with: parameters)
    }
}

// MARK: - HTTP Headers
extension OUApiRouter {
    private func getHttpHeaders() -> HTTPHeaders {
        let acceptLanguage = "en"
        let appVersion = "\(OUInfoPlist.getValue(for: .shortVersion) ?? "")\(OUInfoPlist.getValue(for: .version) ?? "")"
        let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
        let deviceType = OUDevice.deviceInterfaceType.rawValue
        // TODO: - Append authId to authorization when login flow implemented.
//        let authorization = "Bearer " + (ShareUtility.instance.authId ?? "")
        let authorization = "Bearer"
        return HTTPHeaders
            .init(
                [
                    OUNetworkConstants.HttpHeaderField.acceptLanguage.rawValue: acceptLanguage,
                    OUNetworkConstants.HttpHeaderField.authorization.rawValue: authorization,
                    OUNetworkConstants.HttpHeaderField.deviceId.rawValue: deviceId,
                    OUNetworkConstants.HttpHeaderField.deviceType.rawValue: deviceType,
                    OUNetworkConstants.HttpHeaderField.deviceToken.rawValue: deviceType,
                    OUNetworkConstants.HttpHeaderField.appVersion.rawValue: appVersion,
                    OUNetworkConstants.HttpHeaderField.deviceIdTimestamp.rawValue: "", // TODO:- Set value for this header key and verify other header values.
                    OUNetworkConstants.HttpHeaderField.timeZone.rawValue: "\(OUDateUtility.getTimeZoneOffset())",
                    OUNetworkConstants.HttpHeaderField.contentType.rawValue: "application/json"
                ]
        )
    }
}
