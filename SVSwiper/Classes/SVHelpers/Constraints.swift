//
//  Constraints.swift
//  SVSwiper
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import UIKit

// Credits: Brian Voong showed a way to use it. This extension is originally written by Mr. Voong and I am using it for adding constraints in code easily.

/// Extension providing convenient methods for programmatic Auto Layout constraints
public extension UIView {
    
    /// Fills the superview with optional padding on all sides
    /// - Parameters:
    ///   - top: Top padding (default: 0)
    ///   - bottom: Bottom padding (default: 0)
    ///   - leading: Leading padding (default: 0)
    ///   - trailing: Trailing padding (default: 0)
    func svFillSuperView(
        top: CGFloat = 0,
        bottom: CGFloat = 0,
        leading: CGFloat = 0,
        trailing: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superView = superview else { return }
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor, constant: top),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leading),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailing)
        ])
    }
    
    /// Anchors the view to specified layout anchors with optional padding
    /// - Parameters:
    ///   - topAnchor: Optional top anchor to constrain to
    ///   - bottomAnchor: Optional bottom anchor to constrain to
    ///   - leadingAnchor: Optional leading anchor to constrain to
    ///   - trailingAnchor: Optional trailing anchor to constrain to
    ///   - padding: Edge insets for padding (default: .zero)
    func svAnchor(
        topAnchor: NSLayoutYAxisAnchor?,
        bottomAnchor: NSLayoutYAxisAnchor?,
        leadingAnchor: NSLayoutXAxisAnchor?,
        trailingAnchor: NSLayoutXAxisAnchor?,
        padding: UIEdgeInsets = .zero
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        
        if let topAnchor = topAnchor {
            constraints.append(self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top))
        }
        
        if let bottomAnchor = bottomAnchor {
            constraints.append(self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom))
        }
        
        if let leadingAnchor = leadingAnchor {
            constraints.append(self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left))
        }
        
        if let trailingAnchor = trailingAnchor {
            constraints.append(self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding.right))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}
