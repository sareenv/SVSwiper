//
//  SVSwiperController.swift
//  SVSwiper
//
//  Created by Vinayak Sareen on 14/08/2019.
//

import UIKit

/// A view controller that displays a horizontal scrolling onboarding experience
/// - Note: Can be used with modern coordinator delegate pattern or legacy window manipulation
public class SVSwiperController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Constants
    
    private enum Constants {
        static let sliderCellId = "sliderCellid"
        static let buttonHeight: CGFloat = 50
        static let buttonBottomPadding: CGFloat = 60
        static let buttonHorizontalPadding: CGFloat = 10
        static let pageControlBottomPadding: CGFloat = 16
    }
    
    private enum UserDefaultsKeys {
        static let hasCompletedOnboarding = "isOpenedBefore"
    }
    
    // MARK: - Public Properties
    
    /// Delegate for coordinating onboarding flow (recommended approach)
    public weak var coordinatorDelegate: SVSwiperCoordinatorDelegate?
    
    // MARK: - Private UI Components
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = details.count
        pageControl.currentPageIndicatorTintColor = currentPageIndicatorColor
        pageControl.pageIndicatorTintColor = pageIndicatorColor
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private lazy var welcomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(buttonTitle, for: .normal)
        button.backgroundColor = buttonBackgroundColor
        button.setTitleColor(buttonTextColor, for: .normal)
        button.titleLabel?.font = buttonFont
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = buttonCornerRadius
        return button
    }()
    
    // MARK: - Private Properties
    
    private let backgroundColor: UIColor
    private let details: [SVContent]
    private let titleFont: UIFont
    private let descriptionFont: UIFont
    private let titleColor: UIColor
    private let descriptionColor: UIColor
    private let buttonBackgroundColor: UIColor
    private let buttonTextColor: UIColor
    private let buttonFont: UIFont
    private let buttonTitle: String
    private let buttonCornerRadius: CGFloat
    private let currentPageIndicatorColor: UIColor
    private let pageIndicatorColor: UIColor
    
    // Legacy properties for backward compatibility
    private var parentController: UIViewController?
    private var isNavigationSupported: Bool?
    
    // MARK: - Computed Properties
    
    private var titles: [String] {
        details.map { $0.title }
    }
    
    private var descriptions: [String] {
        details.map { $0.description }
    }
    
    private var images: [UIImage?] {
        details.map { $0.image }
    }
    
    // MARK: - Initialization
    
    /// Creates a new onboarding swiper controller with basic customization (Backward compatible)
    /// - Parameters:
    ///   - backgroundColor: The background color for all screens
    ///   - details: Array of SVContent items representing each onboarding screen
    ///   - titleFont: Font for titles (default: bold system font size 14)
    ///   - descriptionFont: Font for descriptions (default: system font size 12)
    public convenience init(
        backgroundColor: UIColor,
        details: [SVContent],
        titleFont: UIFont = UIFont.boldSystemFont(ofSize: 14),
        descriptionFont: UIFont = UIFont.systemFont(ofSize: 12)
    ) {
        self.init(
            backgroundColor: backgroundColor,
            details: details,
            titleFont: titleFont,
            descriptionFont: descriptionFont,
            titleColor: .label,
            descriptionColor: .secondaryLabel,
            buttonBackgroundColor: .systemPurple,
            buttonTextColor: .white,
            buttonFont: UIFont.systemFont(ofSize: 17, weight: .semibold),
            buttonTitle: "Get Started",
            buttonCornerRadius: 5,
            currentPageIndicatorColor: .systemPurple,
            pageIndicatorColor: .systemGray
        )
    }
    
    /// Creates a new onboarding swiper controller with full customization
    /// - Parameters:
    ///   - backgroundColor: The background color for all screens
    ///   - details: Array of SVContent items representing each onboarding screen
    ///   - titleFont: Font for titles
    ///   - descriptionFont: Font for descriptions
    ///   - titleColor: Color for title text (default: .label)
    ///   - descriptionColor: Color for description text (default: .secondaryLabel)
    ///   - buttonBackgroundColor: Background color for the completion button (default: .systemPurple)
    ///   - buttonTextColor: Text color for the completion button (default: .white)
    ///   - buttonFont: Font for the completion button (default: systemFont size 17, semibold)
    ///   - buttonTitle: Title text for the completion button (default: "Get Started")
    ///   - buttonCornerRadius: Corner radius for the completion button (default: 5)
    ///   - currentPageIndicatorColor: Color for the active page indicator (default: .systemPurple)
    ///   - pageIndicatorColor: Color for inactive page indicators (default: .systemGray)
    public init(
        backgroundColor: UIColor,
        details: [SVContent],
        titleFont: UIFont = UIFont.boldSystemFont(ofSize: 14),
        descriptionFont: UIFont = UIFont.systemFont(ofSize: 12),
        titleColor: UIColor = .label,
        descriptionColor: UIColor = .secondaryLabel,
        buttonBackgroundColor: UIColor = .systemPurple,
        buttonTextColor: UIColor = .white,
        buttonFont: UIFont = UIFont.systemFont(ofSize: 17, weight: .semibold),
        buttonTitle: String = "Get Started",
        buttonCornerRadius: CGFloat = 5,
        currentPageIndicatorColor: UIColor = .systemPurple,
        pageIndicatorColor: UIColor = .systemGray
    ) {
        self.backgroundColor = backgroundColor
        self.details = details
        self.titleFont = titleFont
        self.descriptionFont = descriptionFont
        self.titleColor = titleColor
        self.descriptionColor = descriptionColor
        self.buttonBackgroundColor = buttonBackgroundColor
        self.buttonTextColor = buttonTextColor
        self.buttonFont = buttonFont
        self.buttonTitle = buttonTitle
        self.buttonCornerRadius = buttonCornerRadius
        self.currentPageIndicatorColor = currentPageIndicatorColor
        self.pageIndicatorColor = pageIndicatorColor
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        super.init(collectionViewLayout: layout)
        
        showButton(frontParentController: UIViewController())
    }
    
    required init?(coder: NSCoder) {
        // Return nil instead of fatalError to allow Storyboard instantiation
        // Note: Storyboard usage is not recommended for this controller
        return nil
    }
    
    // MARK: - Public Methods
    
    /// Checks if onboarding should be presented based on completion status
    /// - Returns: true if onboarding hasn't been completed yet
    public func shouldShowOnboarding() -> Bool {
        return !UserDefaults.standard.bool(forKey: UserDefaultsKeys.hasCompletedOnboarding)
    }
    
    /// Marks onboarding as completed
    public func markOnboardingCompleted() {
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.hasCompletedOnboarding)
    }
    
    /// Resets onboarding completion status (useful for testing)
    public func resetOnboardingStatus() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.hasCompletedOnboarding)
    }
    
    /// Legacy method for configuring slider with automatic window manipulation
    /// - Parameters:
    ///   - parentViewController: The main view controller to show after onboarding
    ///   - isNavigationSupported: Whether to wrap parent controller in navigation controller
    /// - Warning: This method directly manipulates UIApplication windows. Use coordinatorDelegate instead.
    @available(*, deprecated, message: "Use coordinatorDelegate pattern instead of automatic window manipulation")
    public func configureSlider(parentViewController: UIViewController, isNavigationSupported: Bool?) {
        if self.parentController == nil {
            self.parentController = parentViewController
        }
        self.isNavigationSupported = isNavigationSupported
        
        let hasCompleted = UserDefaults.standard.bool(forKey: UserDefaultsKeys.hasCompletedOnboarding)
        
        if !hasCompleted {
            // Show onboarding
            guard let window = UIApplication.shared.windows.first else { return }
            window.rootViewController = self
            window.makeKeyAndVisible()
        } else {
            // Show main app
            showMainApp()
        }
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSettings()
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // Get current page before rotation
        let currentPage = pageControl.currentPage
        
        coordinator.animate(alongsideTransition: { [weak self] _ in
            guard let self = self else { return }
            
            // Invalidate layout to recalculate cell sizes
            self.collectionView?.collectionViewLayout.invalidateLayout()
            
            // Scroll to current page with new dimensions
            let indexPath = IndexPath(item: currentPage, section: 0)
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            
        }, completion: { [weak self] _ in
            guard let self = self else { return }
            
            // Ensure we're on the correct page after rotation
            let indexPath = IndexPath(item: currentPage, section: 0)
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            
            // Update page control
            self.pageControl.currentPage = currentPage
        })
    }
    
    // MARK: - Private Methods
    
    @objc private func setupWelcomeScreen() {
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.hasCompletedOnboarding)
        
        // Use delegate pattern if available
        if let delegate = coordinatorDelegate {
            delegate.swiperDidComplete(self)
        } else {
            // Fall back to legacy window manipulation
            showMainApp()
        }
    }
    
    private func showMainApp() {
        guard let parentController = parentController,
              let window = UIApplication.shared.windows.first else {
            return
        }
        
        // Set new root based on navigation preference
        if isNavigationSupported == true {
            window.rootViewController = UINavigationController(rootViewController: parentController)
        } else {
            window.rootViewController = parentController
        }
        
        window.makeKeyAndVisible()
    }
    
    private func showButton(frontParentController: UIViewController) {
        guard let collectionView = collectionView else { return }
        
        collectionView.addSubview(welcomeButton)
        welcomeButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
        welcomeButton.svAnchor(
            topAnchor: nil,
            bottomAnchor: view.bottomAnchor,
            leadingAnchor: view.leadingAnchor,
            trailingAnchor: view.trailingAnchor,
            padding: .init(
                top: 0,
                left: Constants.buttonHorizontalPadding,
                bottom: -Constants.buttonBottomPadding,
                right: -Constants.buttonHorizontalPadding
            )
        )
        welcomeButton.addTarget(self, action: #selector(setupWelcomeScreen), for: .touchUpInside)
    }
    
    private func setupPageControl() {
        guard let collectionView = collectionView else { return }
        
        collectionView.addSubview(pageControl)
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.pageControlBottomPadding).isActive = true
    }
    
    private func collectionViewSettings() {
        collectionView?.isPagingEnabled = true
        collectionView?.register(SVSliderCell.self, forCellWithReuseIdentifier: Constants.sliderCellId)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.backgroundColor = backgroundColor
        setupPageControl()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        // Use collectionView's bounds instead of view's frame for accurate sizing
        // This ensures cells adapt to orientation changes
        return collectionView.bounds.size
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
    
    // MARK: - UIScrollViewDelegate
    
    public override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        let currentPage = Int(offSet + horizontalCenter) / Int(width)
        
        pageControl.currentPage = currentPage
        
        // Notify delegate of page change
        coordinatorDelegate?.swiper(self, didScrollToPage: currentPage)
        
        // Show button on last page
        let isLastPage = currentPage == details.count - 1
        welcomeButton.isHidden = !isLastPage
        welcomeButton.isUserInteractionEnabled = isLastPage
    }
    
    // MARK: - UICollectionViewDataSource
    
    public override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return details.count
    }
    
    public override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.sliderCellId,
            for: indexPath
        ) as? SVSliderCell else {
            assertionFailure("Failed to dequeue SVSliderCell")
            return UICollectionViewCell()
        }
        
        guard indexPath.item < details.count else {
            assertionFailure("Index out of bounds: \(indexPath.item) >= \(details.count)")
            return cell
        }
        
        let detail = details[indexPath.item]
        cell.backgroundColor = backgroundColor
        cell.contentTitle = detail.title
        cell.contentDescription = detail.description
        cell.sliderImage = detail.image
        cell.titleFont = titleFont
        cell.descriptionFont = descriptionFont
        cell.titleColor = titleColor
        cell.descriptionColor = descriptionColor
        
        return cell
    }
}
