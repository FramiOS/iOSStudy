import Foundation

class PostViewModel {
    var tableReload: (() -> Void)?
    var posts: Posts? = [Post]() {
        // 테이블 뷰 리로드 처리
        didSet {
            tableReload?()
        }
    }
    
    func fetchData() {
        PostNetworkManager.shared.getPosts { success, data in
            if success {
                self.posts = data
            } else {
                // 에러 처리
            }
            
        }
    }
}
