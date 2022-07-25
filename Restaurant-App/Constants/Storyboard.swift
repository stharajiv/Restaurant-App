//
//  Storyboard.swift
//  Restaurant-App
//
//  Created by Rajiv Shrestha on 7/25/22.
//

import Foundation

// Enumeration is responsible to initialize the View Controllers
enum Storyboard: String, StoryboardProvider {
    case cart, customDeliveryNotes
    
    // Return Storyboard Name
    var storyboardIdentifier: String {
        get {
            switch self{
            case .cart, .customDeliveryNotes:
                return "Cart"
            }
        }
    }
    
    
    // Return View Controller Identifier
    var viewControllerIdentifier: String {
        get {
            switch self{
            case .cart:
                return String(describing: CartViewController.self)
            case .customDeliveryNotes:
                return String(describing: CustomDeliveryNotesViewController.self)
                
            }
        }
    }
    
    // Return Navigation Controller Identifier
    var navigationIdentifier: String {
        get {
            switch self{
            case .cart, .customDeliveryNotes:
                return "CartNavigationController"
            }
        }
    }
}
    
