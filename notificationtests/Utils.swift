//
//  Utils.swift
//  notificationtests
//
//  Created by Pedro Vinicius Cuêlho do Nascimento on 30/05/2019.
//  Copyright © 2019 Pedro Nascimento. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static func alert(title: String? = nil, message: String!) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(okAction)

        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
