//
//  Constraints.swift
//  Pods-SVSwiper_Example
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import UIKit

// Credits: Brian Voong showed a way to use it. This extension is originally wrriten by Mr. Voong and I am using it for adding constraints in code easily.


public extension UIView{
    @available(iOS 9.0, *)
    func svFillSuperView (top: CGFloat=0, bottom: CGFloat=0, leading: CGFloat=0, trailing: CGFloat=0){
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let superView = self.superview else { return }
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: top).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leading).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailing).isActive = true
    }
    @available(iOS 9.0, *)
    func svAnchor(topAnchor: NSLayoutYAxisAnchor?, bottomAnchor: NSLayoutYAxisAnchor?, leadingAnchor: NSLayoutXAxisAnchor?, trailingAnchor: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let topAnchor = topAnchor{
            self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true
            
        }
    
        if let bottomAnchor = bottomAnchor{
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom).isActive = true
        }
        
        if let leadingAnchor = leadingAnchor{
            self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left).isActive = true
        }
        
        if let trailingAnchor = trailingAnchor{
            self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding.right).isActive = true
        }
    }
    
}
