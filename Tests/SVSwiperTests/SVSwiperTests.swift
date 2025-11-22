//
//  SVSwiperTests.swift
//  SVSwiper
//
//  Created by Vinayak Sareen
//

import XCTest
@testable import SVSwiper

final class SVSwiperTests: XCTestCase {
    
    // MARK: - SVContent Tests
    
    func testSVContentInitialization() {
        let content = SVContent(
            title: "Test Title",
            description: "Test Description",
            image: nil
        )
        
        XCTAssertEqual(content.title, "Test Title")
        XCTAssertEqual(content.description, "Test Description")
        XCTAssertNil(content.image)
    }
    
    func testSVContentWithImage() {
        let image = UIImage()
        let content = SVContent(
            title: "Title",
            description: "Desc",
            image: image
        )
        
        XCTAssertNotNil(content.image)
        XCTAssertEqual(content.image, image)
    }
    
    func testSVContentIsValueType() {
        var content1 = SVContent(title: "Title1", description: "Desc1")
        var content2 = content1
        
        // Modifying content2 should not affect content1 (value semantics)
        content2 = SVContent(title: "Title2", description: "Desc2")
        
        XCTAssertEqual(content1.title, "Title1")
        XCTAssertEqual(content2.title, "Title2")
    }
    
    // MARK: - SVSwiperController Tests
    
    func testSwiperControllerInitialization() {
        let details = [
            SVContent(title: "Screen 1", description: "Description 1"),
            SVContent(title: "Screen 2", description: "Description 2")
        ]
        
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: details
        )
        
        XCTAssertNotNil(controller)
        XCTAssertEqual(controller.collectionView?.numberOfSections, 1)
    }
    
    func testSwiperControllerEmptyDetails() {
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: []
        )
        
        XCTAssertNotNil(controller)
        XCTAssertEqual(controller.collectionView?.numberOfItems(inSection: 0), 0)
    }
    
    func testOnboardingCompletionStatus() {
        let details = [SVContent(title: "Test", description: "Test")]
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: details
        )
        
        // Reset to ensure clean state
        controller.resetOnboardingStatus()
        
        // Should show onboarding initially
        XCTAssertTrue(controller.shouldShowOnboarding())
        
        // Mark as completed
        controller.markOnboardingCompleted()
        
        // Should not show onboarding after completion
        XCTAssertFalse(controller.shouldShowOnboarding())
        
        // Reset for next test
        controller.resetOnboardingStatus()
        XCTAssertTrue(controller.shouldShowOnboarding())
    }
    
    func testCoordinatorDelegateIntegration() {
        let details = [SVContent(title: "Test", description: "Test")]
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: details
        )
        
        let mockDelegate = MockCoordinatorDelegate()
        controller.coordinatorDelegate = mockDelegate
        
        XCTAssertNotNil(controller.coordinatorDelegate)
        XCTAssertTrue(controller.coordinatorDelegate === mockDelegate)
    }
    
    func testCollectionViewConfiguration() {
        let details = [
            SVContent(title: "Screen 1", description: "Description 1"),
            SVContent(title: "Screen 2", description: "Description 2"),
            SVContent(title: "Screen 3", description: "Description 3")
        ]
        
        let controller = SVSwiperController(
            backgroundColor: .systemBlue,
            details: details
        )
        
        // Load view
        _ = controller.view
        
        XCTAssertNotNil(controller.collectionView)
        XCTAssertEqual(controller.collectionView?.isPagingEnabled, true)
        XCTAssertEqual(controller.collectionView?.showsHorizontalScrollIndicator, false)
        XCTAssertEqual(controller.collectionView?.backgroundColor, .systemBlue)
    }
    
    func testCollectionViewDataSource() {
        let details = [
            SVContent(title: "Screen 1", description: "Description 1"),
            SVContent(title: "Screen 2", description: "Description 2")
        ]
        
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: details
        )
        
        // Load view
        _ = controller.view
        
        let numberOfItems = controller.collectionView(controller.collectionView!, numberOfItemsInSection: 0)
        XCTAssertEqual(numberOfItems, 2)
    }
    
    func testCellConfiguration() {
        let image = UIImage()
        let details = [
            SVContent(title: "Test Title", description: "Test Description", image: image)
        ]
        
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: details
        )
        
        // Load view
        _ = controller.view
        
        let indexPath = IndexPath(item: 0, section: 0)
        let cell = controller.collectionView(
            controller.collectionView!,
            cellForItemAt: indexPath
        ) as? SVSliderCell
        
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.contentTitle, "Test Title")
        XCTAssertEqual(cell?.contentDescription, "Test Description")
        XCTAssertNotNil(cell?.sliderImage)
    }
    
    // MARK: - SVSliderCell Tests
    
    func testSliderCellInitialization() {
        let cell = SVSliderCell(frame: .zero)
        
        XCTAssertNotNil(cell)
        XCTAssertNil(cell.contentTitle)
        XCTAssertNil(cell.contentDescription)
        XCTAssertNil(cell.sliderImage)
    }
    
    func testSliderCellContentConfiguration() {
        let cell = SVSliderCell(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
        
        cell.contentTitle = "Test Title"
        cell.contentDescription = "Test Description"
        
        XCTAssertEqual(cell.contentTitle, "Test Title")
        XCTAssertEqual(cell.contentDescription, "Test Description")
    }
    
    func testSliderCellImageConfiguration() {
        let cell = SVSliderCell(frame: .zero)
        let image = UIImage()
        
        cell.sliderImage = image
        
        XCTAssertNotNil(cell.sliderImage)
        XCTAssertEqual(cell.sliderImage, image)
    }
    
    // MARK: - Edge Cases
    
    func testSingleSlideOnboarding() {
        let details = [SVContent(title: "Single", description: "Only one slide")]
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: details
        )
        
        _ = controller.view
        
        XCTAssertEqual(controller.collectionView?.numberOfItems(inSection: 0), 1)
    }
    
    func testLargeNumberOfSlides() {
        let details = (1...10).map { index in
            SVContent(title: "Slide \(index)", description: "Description \(index)")
        }
        
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: details
        )
        
        _ = controller.view
        
        XCTAssertEqual(controller.collectionView?.numberOfItems(inSection: 0), 10)
    }
    
    func testCustomFonts() {
        let titleFont = UIFont.systemFont(ofSize: 24, weight: .bold)
        let descFont = UIFont.systemFont(ofSize: 16)
        
        let controller = SVSwiperController(
            backgroundColor: .white,
            details: [SVContent(title: "Test", description: "Test")],
            titleFont: titleFont,
            descriptionFont: descFont
        )
        
        XCTAssertNotNil(controller)
    }
}

// MARK: - Mock Objects

class MockCoordinatorDelegate: SVSwiperCoordinatorDelegate {
    var didCompleteCalled = false
    var shouldShowResult = true
    var lastScrolledPage: Int?
    
    func swiperDidComplete(_ controller: SVSwiperController) {
        didCompleteCalled = true
    }
    
    func swiperShouldShow(_ controller: SVSwiperController) -> Bool {
        return shouldShowResult
    }
    
    func swiper(_ controller: SVSwiperController, didScrollToPage page: Int) {
        lastScrolledPage = page
    }
}
