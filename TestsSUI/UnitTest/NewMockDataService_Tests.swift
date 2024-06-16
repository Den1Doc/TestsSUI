//import XCTest
//@testable import UnitTesting
//import Combine
//
//final class NewMockDataService_Tests: XCTestCase {
//    
//    var cancellables = Set<AnyCancellable>()
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        cancellables.removeAll()
//    }
//
//    func test_NewMockDataService_init_does() {
//        
//        let items: [String]? = nil
//        let items2: [String]? = []
//        let items3: [String]? = [UUID().uuidString, UUID().uuidString]
//
//        
//        let dataService = NewMockDataService(items: items)
//        let dataService2 = NewMockDataService(items: items2)
//        let dataService3 = NewMockDataService(items: items3)
//
//        
//        XCTAssertFalse(dataService.items.isEmpty)
//        XCTAssertTrue(dataService2.items.isEmpty)
//        XCTAssertEqual(dataService3.items.count, items3?.count)
//        
//    }
//    
//    func test_NewMockDataService_download_doesReturn() {
//        
//        let dataService = NewMockDataService(items: nil)
//
//        var items: [String] = []
//        let expectation = XCTestExpectation()
//        
//        dataService.downloadItemEscaping { returnItems in
//            items = returnItems
//            expectation.fulfill()
//        }
//        
//        wait(for: [expectation], timeout: 5)
//        XCTAssertEqual(items.count, dataService.items.count)
//        
//    }
//    
//    func test_NewMockDataService_download_doesReturnValue() {
//        
//        let dataService = NewMockDataService(items: nil)
//
//        var items: [String] = []
//        let expectation = XCTestExpectation()
//        
//        dataService.donwloadItemsCombine()
//            .sink { comletion in
//                switch comletion {
//                case .finished:
//                    break
//                case .failure:
//                    break
//                }
//            } receiveValue: { returnItems in
//                items = returnItems
//                expectation.fulfill()
//            }
//            .store(in: &cancellables)
//        
//        
//        
//        wait(for: [expectation], timeout: 5)
//        XCTAssertEqual(items.count, dataService.items.count)
//        
//    }
//
//}
