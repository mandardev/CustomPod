//
//  ApiClient.swift
//  GoodCheckup-Doctor
//
//  Created by Mandar Choudhary on 22/09/20.
//  Copyright © 2020 Vaibhav Deshpande. All rights reserved.
//

import Alamofire
import RxSwift
import ObjectMapper

class OUApiClient {

    //-------------------------------------------------------------------------------------------------
    // MARK: - The request function to get results in an Observable
    private static func request<T: Mappable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
        return Observable.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            let request = AF.request(urlConvertible).responseJSON { response in
                //Check the result from Alamofire's response and check if it's a success or a failure

                switch response.result {
                case .success(let value):
                    //Everything is fine, return the value in onNext
                    if let dataObject = Mapper<T>().map(JSONObject: value) {
                        observer.onNext(dataObject)
                    } else {
                        observer.onError(OUApiError.formattingError)
                    }
                case .failure(let error):
                    //Something went wrong, switch on the status code and return the error
                    switch response.response?.statusCode {
                    case 403:
                        observer.onError(OUApiError.forbidden)
                    case 404:
                        observer.onError(OUApiError.notFound)
                    case 409:
                        observer.onError(OUApiError.conflict)
                    case 500:
                        observer.onError(OUApiError.internalServerError)
                    default:
                        observer.onError(error)
                    }
                }
            }

            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

// MARK: - Login APIs
extension OUApiClient {

    static func videoCallInitiate(videoCallRequest: VideoCallInitiateRequest) -> Observable<VideoCallInitiateModel> {
        return request(OUApiRouter.videoCallInitiate(videoCallRequest))
    }
    
    static func videoCallEnd(videoCallEndRequest: VideoCallEndRequest) -> Observable<VideoCallEndModel> {
        return request(OUApiRouter.videoCallEnd(videoCallEndRequest))
    }
    
    static func videoCallCancel(videoCallCancelRequest: VideoCallCancelRequest) -> Observable<VideoCallCancelModel> {
        return request(OUApiRouter.videoCallCancel(videoCallCancelRequest))
    }
}
