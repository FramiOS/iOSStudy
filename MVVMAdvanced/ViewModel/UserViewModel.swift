import Foundation

final class UserViewModel {
    var data: ObservableObject<User?> = ObservableObject(nil)
    
    func fetchData() {
        NetworkManager.shared.getUser { [weak self] isSuccess, data in
            if isSuccess {
                self?.data.value = data
            }
        }
    }
}
