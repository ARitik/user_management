import UIKit

class AddScreenView: UIView {
    let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "First Name"
        // Additional styling for the text field
        return textField
    }()

    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Last Name"
        // Additional styling for the text field
        return textField
    }()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        // Additional styling for the text field
        return textField
    }()

    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Phone"
        // Additional styling for the text field
        return textField
    }()

    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.backgroundColor = UIColor.orange // Change the button color
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10 // Adjust the corner radius as needed
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
        addSubview(firstNameTextField)
        addSubview(lastNameTextField)
        addSubview(emailTextField)
        addSubview(phoneTextField)
        addSubview(saveButton)

        NSLayoutConstraint.activate([
            // Add constraints to position the UI components just below the navigation title
            firstNameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            firstNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            firstNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 10),
            lastNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lastNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            phoneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            phoneTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            phoneTextField.heightAnchor.constraint(equalToConstant: 40),
            
            saveButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }


}

