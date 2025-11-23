//
//  SVSliderCell.swift
//  SVSwiper
//
//  Created by DataBunker on 10/01/2021.
//

import UIKit

/// A collection view cell that displays onboarding content with an image, title, and description
public class SVSliderCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let imageHeight: CGFloat = 200
        static let stackSpacing: CGFloat = 10
        static let horizontalPadding: CGFloat = 20
    }
    
    // MARK: - Public Properties
    
    /// The title text displayed on the cell
    public var contentTitle: String? {
        didSet {
            contentTitleLabel.text = contentTitle ?? "title"
        }
    }
    
    /// The description text displayed below the title
    public var contentDescription: String? {
        didSet {
            contentDescriptionLabel.text = contentDescription ?? "description"
        }
    }
    
    /// The image displayed above the title and description
    public var sliderImage: UIImage? {
        didSet {
            contentImageView.image = sliderImage
            contentImageView.isHidden = sliderImage == nil
        }
    }
    
    /// The font for the title text
    public var titleFont: UIFont = UIFont.boldSystemFont(ofSize: 21) {
        didSet {
            contentTitleLabel.font = titleFont
        }
    }
    
    /// The font for the description text
    public var descriptionFont: UIFont = UIFont.systemFont(ofSize: 18) {
        didSet {
            contentDescriptionLabel.font = descriptionFont
        }
    }
    
    /// The color for the title text
    public var titleColor: UIColor = .label {
        didSet {
            contentTitleLabel.textColor = titleColor
        }
    }
    
    /// The color for the description text
    public var descriptionColor: UIColor = .secondaryLabel {
        didSet {
            contentDescriptionLabel.textColor = descriptionColor
        }
    }
    
    // MARK: - Private UI Components
    
    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var contentTitleLabel: UILabel = {
        let label = UILabel()
        label.font = titleFont
        label.textColor = titleColor
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var contentDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = descriptionFont
        label.textColor = descriptionColor
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = Constants.stackSpacing
        sv.distribution = .fill
        sv.alignment = .center
        sv.axis = .vertical
        return sv
    }()
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupDetailsLabels()
        setupContentImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        // Return nil instead of fatalError to support Storyboard/XIB if needed
        return nil
    }
    
    // MARK: - Setup Methods
    
    private func setupContentImageViewConstraints() {
        contentImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight).isActive = true
    }
    
    private func setupVStackConstraints() {
        vStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        vStackView.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: Constants.horizontalPadding
        ).isActive = true
        vStackView.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: -Constants.horizontalPadding
        ).isActive = true
    }
    
    private func setupDetailsLabels() {
        vStackView.addArrangedSubview(contentImageView)
        vStackView.addArrangedSubview(contentTitleLabel)
        vStackView.addArrangedSubview(contentDescriptionLabel)
        addSubview(vStackView)
        setupVStackConstraints()
    }
}
