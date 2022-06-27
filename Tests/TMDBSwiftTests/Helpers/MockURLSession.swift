import Foundation
@testable import TMDBSwift

final class MockURLSession: URLSessionProtocol {
    var result = Result<Data, Error>.success(Data())

    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        try (result.get(), URLResponse())
    }
}
