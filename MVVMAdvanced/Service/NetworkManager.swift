import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    func getUser(completion: @escaping (Bool, User?) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/2") else {
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
                let model = try JSONDecoder().decode(User.self, from: data!)
                completion(true, model)
            } catch {
                completion(false, nil)
            }
        }.resume()
    }
}
