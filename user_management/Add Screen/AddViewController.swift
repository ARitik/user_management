import UIKit

class AddViewController: UIViewController {
    private let addScreenView = AddScreenView()
    
    override func loadView() {
        view = addScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add User"
        
        // Add save button action
        addScreenView.saveButton.addTarget(self, action: #selector(saveUser), for: .touchUpInside)
    }
    
    @objc func saveUser() {
        guard let firstName = addScreenView.firstNameTextField.text,
                  let lastName = addScreenView.lastNameTextField.text,
                  let email = addScreenView.emailTextField.text,
                  let phone = addScreenView.phoneTextField.text else {
                return
            }

        let databaseManager = DatabaseManager()
        databaseManager.addUser(firstName: firstName, lastName: lastName, email: email, phone: phone)
        navigationController?.popViewController(animated: true)
        
    }

    
}
