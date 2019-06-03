//
//  TableViewUtils.swift
//  notificationtests
//
//  Created by Pedro Vinicius Cuêlho do Nascimento on 03/06/2019.
//  Copyright © 2019 Pedro Nascimento. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func defineMessageForEmptyTableView(numberOfItems: Int, emptyMessage: String) {
        if numberOfItems > 0 {
            self.separatorStyle = .singleLine
            self.backgroundView = nil
            return
        }

        // Getting the screen size
        let rectScreen = CGRect(x: 0,
                                y: 0,
                                width: UIApplication.shared.keyWindow?.bounds.width ?? 0,
                                height: UIApplication.shared.keyWindow?.bounds.height ?? 0)

        // Configuring the label
        let emptyTableMessage = UILabel(frame: rectScreen)
        emptyTableMessage.text = emptyMessage
        emptyTableMessage.textColor = UIColor.lightGray
        emptyTableMessage.textAlignment = .center
        emptyTableMessage.sizeToFit()
        emptyTableMessage.numberOfLines = 0

        // Putting the label in tableview background
        self.backgroundView = emptyTableMessage
        self.separatorStyle = .none
    }
    
}
