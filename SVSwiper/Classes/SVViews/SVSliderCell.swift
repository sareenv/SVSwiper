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
    
    public var sliderImage: UIImage? {
        didSet {
            setupContentImage(contentImage: sliderImage)
        }
    }
    
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
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
        sv.alignment = .center
        sv.axis = .vertical
        return sv
    }()
    
    
    private func setupContentImageViewConstraints() {
        let estimatedHeight = CGFloat(200)
        contentImageView.heightAnchor.constraint(equalToConstant: estimatedHeight).isActive = true
    }
    
    private func setupContentImage(contentImage: UIImage?) {
        setupContentImageViewConstraints()
        if let contentImage = contentImage {
            self.contentImageView.image = contentImage
            return
        }
        vStackView.removeArrangedSubview(contentImageView)
    }
    
    private func setupVStackConstraints() {
        vStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        vStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        vStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupDetailsLabels() {
        vStackView.addArrangedSubview(contentImageView)
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
