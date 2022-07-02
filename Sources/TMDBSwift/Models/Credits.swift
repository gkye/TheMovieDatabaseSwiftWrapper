import Foundation

/// <#Description#>
public struct Credits: Codable, Equatable {
    /// <#Description#>
    let id: Int
    /// <#Description#>
    let cast: [CastMember]
    /// <#Description#>
    let crew: [CrewMember]
}
