//
//  SVSliderCell.swift
//  Pods-SVSwiper_Example
//
//  Created by DataBunker on 10/01/2021.
//

import UIKit

public class SVSliderCell: UICollectionViewCell {
   
    public var contentTitle: String? {didSet {contentTitleLabel.text = contentTitle ?? "title"} }
    public var contentDescription: String? {didSet {contentDescriptionLabel.text = contentDescription ?? "description"} }
    
    lazy var contentTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var contentDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 10
        sv.distribution = .fill
        sv.axis = .vertical
        return sv
    }()
    
    private func setupVStackConstraints() {
        vStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        vStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        vStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupDetailsLabels() {
        vStackView.addArrangedSubview(contentTitleLabel)
        vStackView.addArrangedSubview(contentDescriptionLabel)
        addSubview(vStackView)
        setupVStackConstraints()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupDetailsLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
