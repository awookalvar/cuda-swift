import XCTest
@testable import CuBLAS

class CuBLASTests: XCTestCase {

    func testInitialization() {
        measure {
            _ = BLAS.global
        }
    }

    func testSum() {
        measure {
        let xx: [Float] = [1,2,2,-3,4,5]
            let result = BLAS.global.absSum(xx)
            XCTAssertEqual(result, xx.reduce(0, {$0+abs($1)}))
            let xxDouble: [Double] = [1,2,2,3,4,-5]
            let resultDouble = BLAS.global.absSum(xxDouble)
            XCTAssertEqual(resultDouble, xxDouble.reduce(0, {$0+abs($1)}))
        }
    }

    static var allTests : [(String, (CuBLASTests) -> () throws -> Void)] {
        return [
        ]
    }
}
