//
//  NewsAppDemoTests.swift
//  NewsAppDemoTests
//
//  Created by Yoonha Kim on 5/7/21.
//

@testable import NewsAppDemo
import XCTest

class NewsAppDemoTests: XCTestCase {
    
    var vm: NewsTableCellViewModel!
    var valueModel: Value!

    override func setUpWithError() throws {
        try super.setUpWithError()
        vm = NewsTableCellViewModel(news: createValue())
        valueModel = createValue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        vm = nil
        valueModel = nil
    }
    
    func testCellViewModelInitSuccess() {
        let cellViewModel = NewsTableCellViewModel(news: createValue())
        XCTAssertNotNil(cellViewModel)
    }
    
    func testCellViewModelNewsTitle() {
        XCTAssertEqual(vm.newsTitle, valueModel.title)
    }
    
    func testCellViewModelPublishedAt() {
        XCTAssertEqual(vm.newsPublishedAt, valueModel.datePublished)
    }

    func testCellViewModelNewsThumbnailsUrl() {
        XCTAssertEqual(vm.newsThumbnailsUrl, valueModel.image.url )
    }
    
   // MARK: - Helpers Data Creation method
    private func createValue() -> Value {
        let provider = Provider(name: "someone")
        let image = Image(url: "urlAddress.com", thumbnail: "Someone")
       return Value(id: "1112",
                    title: "test",
                    url: "www.google.com",
                    description: "this is test case",
                    body: "Body test",
                    keywords: "Keyword",
                    language: "eng",
                    isSafe: true,
                    datePublished: "2021-05/21",
                    provider: provider,
                    image: image)
    }
}
