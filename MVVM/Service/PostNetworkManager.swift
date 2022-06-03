import Foundation

class PostNetworkManager {
    static let shared = PostNetworkManager()
    private init() { }
    
    func getPosts(completion: @escaping (Bool, Posts?) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(false, nil)
                print("error ::: \(error!)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                completion(false, nil)
                return
            }
            
            do {
                let model = try JSONDecoder().decode(Posts.self, from: data!)
                completion(true, model)
            } catch {
                completion(false, nil)
            }
        }.resume()
    }
}
