//
//  SVUtility.swift
//  SVSwiper
//
//  Created by DataBunker on 2022-09-15.
//

import UIKit

extension UIViewController {
        
  func removeChild() {
    self.children.forEach {
      $0.willMove(toParent: nil)
      $0.view.removeFromSuperview()
      $0.removeFromParent()
    }
  }
}
