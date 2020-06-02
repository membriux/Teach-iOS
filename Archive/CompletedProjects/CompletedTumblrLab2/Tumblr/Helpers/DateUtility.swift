//
//  DataUtility.swift
//  Tumblr
//
//  Created by Memo on 10/12/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import Foundation


struct DateUtil {
    
    // Formats a timestamp from the API and converts it to MMM d, h:mm a
    static func formatPostTime(to format: String, from timeStamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    
}
