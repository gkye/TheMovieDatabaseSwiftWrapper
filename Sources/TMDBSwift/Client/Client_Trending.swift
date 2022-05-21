import Foundation

extension Client {

    static func trending(baseURL: String, completion: @escaping (ClientReturn) -> Void) {

        let url = "https://api.themoviedb.org/3/trending/" + baseURL
        networkRequest(url: url, parameters: [:]) { apiReturn in
            if apiReturn.error == nil {
                completion(apiReturn)
            }
        }
    }

}
