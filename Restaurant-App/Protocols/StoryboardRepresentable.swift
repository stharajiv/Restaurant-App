//
//  StoryboardRepresentable.swift
//  Restaurant-App
//
//  Created by Rajiv Shrestha on 7/25/22.
//

import Foundation
import UIKit

protocol StoryboardRepresentable {
  static func initFromStoryboard() -> Self
  // static func initWithNavBar() -> Self {
}

/// Cast the argument to the infered function return type.

func autoCast<T>(_ x: Any) -> T {
  return x as! T
}

protocol StoryboardProvider {
  var storyboardIdentifier: String { get }
  var viewControllerIdentifier: String { get }
  var navigationIdentifier: String { get }
}

extension StoryboardProvider  {
  
  func initWithNavigationController() -> UINavigationController{
    return  UIStoryboard(name: self.storyboardIdentifier, bundle: nil).instantiateViewController(withIdentifier: self.navigationIdentifier) as! UINavigationController
  }
  
  func initWithViewController() -> UIViewController{
    return  UIStoryboard(name: self.storyboardIdentifier, bundle: nil).instantiateViewController(withIdentifier: self.viewControllerIdentifier)
  }
}


