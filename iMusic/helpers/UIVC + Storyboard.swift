//
//  UIVC + Storyboard.swift
//  iMusic
//
//  Created by Алим Куприянов on 08.08.2021.
//

import UIKit


extension UIViewController {
    
    class func loadFromStoryboard <T:UIViewController>() -> T {
        
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        }
        else {
            fatalError("no vc in generic")
        }
    }
}
