import UIKit

class UserViewController: UIViewController {
    private let viewModel = UserViewModel()
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nameLabel.backgroundColor = .gray
        emailLabel.backgroundColor = .yellow
        
        nameLabel.text = "이름입니다"
        emailLabel.text = "이메일입니다"
        
        setupBinders() // ⭐️ 1
        attachUI()
        
        viewModel.fetchData() // ⭐️ 2
    }
    
    // ⭐️ 3
    func setupBinders() {
        viewModel.data.bind { [weak self] user in
            guard let user = user else { return }
            DispatchQueue.main.async {
                self?.nameLabel.text = user.userName
                self?.emailLabel.text = user.email
            }
        }
    }

    func attachUI() {
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
}
