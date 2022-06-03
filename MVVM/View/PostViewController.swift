import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = PostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.backgroundColor = .gray
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(PostTableViewCell.nib, forCellReuseIdentifier: PostTableViewCell.identifier)
        
        viewModel.tableReload = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.fetchData()
    }
}

extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts?.count ?? 0
    }
}

extension PostViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        if let data = viewModel.posts?[indexPath.row] {
            cell.data = data
        }
        
        return cell
    }
}
