@testable import TMDBSwift
import Foundation

extension Video {
    static let mock = Video(id: "12345",
                            countryCode: "US",
                            languageCode: "en",
                            key: "54321",
                            name: "something",
                            site: "eyes",
                            size: 1080,
                            type: "big",
                            isOfficial: false,
                            publishedDate: Calendar.current.date(from: DateComponents(year: 2021, month: 5, day: 3, hour: 4, minute: 00, second: 12)))
}
