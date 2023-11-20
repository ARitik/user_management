import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let mainScreenView = MainScreenView()
    var users: [User] = [] // Populate this array with user data from the database

    override func loadView() {
        view = mainScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Admin Dashboard"
        navigationController?.navigationBar.prefersLargeTitles = true

        // Configure the table view
        mainScreenView.tableView.delegate = self
        mainScreenView.tableView.dataSource = self
        mainScreenView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        mainScreenView.tableView.separatorStyle = .none

        // Set up the "Add User" button action to navigate to AddUserViewController
        mainScreenView.addButton.addTarget(self, action: #selector(addUser), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Load data from the database and populate the users array
        loadUsersFromDatabase()
        
        // Reload data when the view appears to reflect any changes
        mainScreenView.tableView.reloadData()
    }

    // MARK: - Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = users[indexPath.row]

        // Create a container view to hold the cell content
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white // Set the background color to white
        containerView.layer.cornerRadius = 10 // Add rounded corners

        // Add shadow to the container view for depth
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 4

        // First Name and Last Name labels
        let nameLabel = UILabel()
        nameLabel.text = "\(user.firstName ?? "") \(user.lastName ?? "")"
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold) // Use a bold font for names
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        // Email label
        let emailLabel = UILabel()
        emailLabel.text = user.email
        emailLabel.font = UIFont.systemFont(ofSize: 16) // Use a regular font for email
        emailLabel.textColor = .black // Set text color to black
        emailLabel.translatesAutoresizingMaskIntoConstraints = false

        // Phone number label
        let phoneLabel = UILabel()
        phoneLabel.text = user.phone
        phoneLabel.font = UIFont.systemFont(ofSize: 14) // Use a regular font for phone
        phoneLabel.textColor = .gray // Set text color to gray
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false

        // Stack view to organize labels vertically
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel, phoneLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        // Add stack view to the container view
        containerView.addSubview(stackView)

        // Configure constraints for stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
        ])

        // Add container view to the cell's content view
        cell.contentView.addSubview(containerView)

        // Configure constraints for container view
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -8),
        ])

        // Style the cell's background and selection color
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.selectedBackgroundView = UIView() // Remove selection color

        return cell
    }

    

    
    // MARK: - Table View Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection and navigate to the edit page (EditUserViewController)
        let selectedUser = users[indexPath.row]
        let editViewController = EditViewController(user: selectedUser)
        navigationController?.pushViewController(editViewController, animated: true)
    }

    // MARK: - User Actions

    @objc func addUser() {
        // Handle the action for adding a new user and navigate to AddUserViewController
        let addViewController = AddViewController()
        navigationController?.pushViewController(addViewController, animated: true)
    }
    
    // Load data from the database and populate the users array
    func loadUsersFromDatabase() {
        let databaseManager = DatabaseManager()
        users = databaseManager.getAllUsers()
    }
}

