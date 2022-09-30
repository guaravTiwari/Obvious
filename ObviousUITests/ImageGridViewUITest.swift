  //
  //  ImageGridViewUITest.swift
  //  ObviousUITests
  //
  //  Created by Gaurav Tiwari on 24/09/22.
  //

import XCTest

final class ImageGridViewUITest: XCTestCase {
  
  let app = XCUIApplication()
  
  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launch()
  }
  
  func test_grid_item_tap() {
    let gridItem = XCUIApplication().scrollViews
      .children(matching: .other)
      .element(boundBy: 0).children(matching: .other)
      .element
    
    XCTAssert(gridItem.exists)
    
    gridItem.tap()
    
    let detailTitle = app.staticTexts["ImageDetailTitle"]
    XCTAssert(detailTitle.exists)
    
    let titleValue = detailTitle.label
    
    app.swipeLeft()
    
    let detailTitleNew = app.staticTexts["ImageDetailTitle"]
    XCTAssert(detailTitleNew.exists)
    
    let titleValueNew = detailTitleNew.label
    XCTAssertNotEqual(titleValue, titleValueNew)
    
    app.swipeRight()

    let detailTitlePrevious = app.staticTexts["ImageDetailTitle"]
    XCTAssert(detailTitlePrevious.exists)
    
    let titleValuePrevious = detailTitlePrevious.label
    XCTAssertNotEqual(titleValuePrevious, titleValueNew)
    
    XCTAssertEqual(titleValuePrevious, titleValue)
  }
  
}
