//
//  PDFProvider.swift
//  notificationtests
//
//  Created by Pedro Vinicius Cuêlho do Nascimento on 29/05/2019.
//  Copyright © 2019 Pedro Nascimento. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PDFProvider {
    static func getPDFs(completionHandler: @escaping (Bool, Any) -> ()) {
        Alamofire.request(Constants.URLs.PDFsJSON).responseArray(completionHandler: { (response: DataResponse<[PDF]>) in
            guard let result = response.result.value else {
                print("Cannot retrieve JSON file from server.")

                if let networkError = response.error {
                    completionHandler(response.result.isSuccess, networkError)
                    return
                }

                completionHandler(false, NSError(domain: "Erro genérico", code: 0, userInfo: nil))
                return
            }

            completionHandler(response.result.isSuccess, result)
        })
    }
}
