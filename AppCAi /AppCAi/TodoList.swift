//
//  TodoList.swift
//  AppCAi
//
//  Created by David Galemiri on 21-01-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import Foundation

class TodoList {
    class var sharedInstance : TodoList {
        struct Static {
            static let instance : TodoList = TodoList()
        }
        return Static.instance
    }
}
