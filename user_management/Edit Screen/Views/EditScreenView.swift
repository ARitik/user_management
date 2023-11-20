import UIKit

class EditScreenView: UIView {
    let firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First Name"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold) // Updated font size and weight
        // Additional styling for the label
        return label
    }()
    
    let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter first name"
        // Additional styling for the text field
        return textField
    }()
    
    let lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Last Name"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold) // Updated font size and weight
        // Additional styling for the label
        return label
    }()
    
    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter last name"
        // Additional styling for the text field
        return textField
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold) // Updated font size and weight
        // Additional styling for the label
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter email"
        // Additional styling for the text field
        return textField
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold) // Updated font size and weight
        // Additional styling for the label
        return label
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter phone"
        // Additional styling for the text field
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.backgroundColor = UIColor.orange // Change the button color to orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10 // Adjust the corner radius as needed
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete User", for: .normal)
        button.backgroundColor = UIColor.red // Change the button color to red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10 // Adjust the corner radius as needed
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        
        firstNameTextField.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Light grey background
               lastNameTextField.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Light grey background
               emailTextField.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Light grey background
               phoneTextField.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Light grey background
        
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(firstNameLabel)
        addSubview(firstNameTextField)
        addSubview(lastNameLabel)
        addSubview(lastNameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(phoneLabel)
        addSubview(phoneTextField)
        addSubview(saveButton)
        addSubview(deleteButton)
        NSLayoutConstraint.activate([
            // Positioning constraints for labels and input fields
            firstNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            firstNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 8),
            firstNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40), // Adjust the height as needed with padding

            lastNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 16),
            lastNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 8),
            lastNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lastNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40), // Adjust the height as needed with padding

            emailLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 16),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 40), // Adjust the height as needed with padding

            phoneLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 8),
            phoneTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            phoneTextField.heightAnchor.constraint(equalToConstant: 40), // Adjust the height as needed with padding
            
            saveButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 32),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16), // Align to the left
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 40),

            // Add Delete User button
            deleteButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 32),
            deleteButton.leadingAnchor.constraint(equalTo: saveButton.trailingAnchor, constant: 16), // Add spacing between Save and Delete
            deleteButton.widthAnchor.constraint(equalToConstant: 120),
            deleteButton.heightAnchor.constraint(equalToConstant: 40),

        ])

    }
}

