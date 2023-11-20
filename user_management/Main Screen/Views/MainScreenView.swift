import UIKit

class MainScreenView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add User", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.orange // Change the button color to orange
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16) // Adjust font size as needed
        button.contentHorizontalAlignment = .left // Align the button text to the left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0) // Add left padding
        button.layer.cornerRadius = 5 // Adjust the corner radius as needed
        button.contentVerticalAlignment = .center // Center the text vertically
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(addButton)
        addSubview(tableView)

        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // Adjust left alignment as needed
            addButton.widthAnchor.constraint(equalToConstant: 100), // Adjust button width as needed
            addButton.heightAnchor.constraint(equalToConstant: 40), // Adjust button height as needed

            tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10), // Place the table view below the button
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

