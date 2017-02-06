//
//  UserOptions.swift
//  GreencardTracker
//
//  Created by ncurtis on 2/5/17.
//  Copyright © 2017 noelcurtis. All rights reserved.
//

import Foundation

enum EmploymentApplicationFamily {
    case first
    case second
    case third
    case otherWorkers
    case fourth
    case religiousWorkers
    case fifthNonRegional
    case fifthRegional
}

class UserOptions {
    var priorityDate: Date! = Date()
    var applicationFamily: EmploymentApplicationFamily! = .second
}
