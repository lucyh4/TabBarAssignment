//
//  UIImage.swift
//  AlineaAssignment
//
//  Created by Neha on 26/09/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

extension UIImage {
    static var sort: UIImage {
        guard let image = UIImage(named: "sort", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("sort image not found")
        }
        return image
    }
    static var risk: UIImage {
        guard let image = UIImage(named: "risk", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("risk image not found")
        }
        return image
    }
    
    static var go_green: UIImage {
        guard let image = UIImage(named: "go_green", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("go-green image not found")
        }
        return image
    }
    
    static var female: UIImage {
        guard let image = UIImage(named: "female", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("female image not found")
        }
        return image
    }
    static var drop: UIImage {
        guard let image = UIImage(named: "drop", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("drop image not found")
        }
        return image
    }
    static var home: UIImage {
        guard let image = UIImage(named: "home", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("home image not found")
        }
        return image
    }
    static var users: UIImage {
        guard let image = UIImage(named: "users", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("users image not found")
        }
        return image
    }
    static var slack: UIImage {
        guard let image = UIImage(named: "slack", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("slack image not found")
        }
        return image
    }
    static var pinterest: UIImage {
        guard let image = UIImage(named: "pinterest", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("pinterest image not found")
        }
        return image
    }
    static var search: UIImage {
        guard let image = UIImage(named: "search", in: Bundle(identifier: "main"), compatibleWith: nil) else {
            fatalError("search image not found")
        }
        return image
    }
}
