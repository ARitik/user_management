import UIKit

class EditViewController: UIViewController {
    private let editScreenView = EditScreenView()
    private var user: User // The user you want to edit
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = editScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit User"
        
        // Set up the user data in the view
        editScreenView.firstNameTextField.text = user.firstName
        editScreenView.lastNameTextField.text = user.lastName
        editScreenView.emailTextField.text = user.email
        editScreenView.phoneTextField.text = user.phone
        
        // Add save button action
        editScreenView.saveButton.addTarget(self, action: #selector(saveUser), for: .touchUpInside)
        
        // Add Delete User button action
        editScreenView.deleteButton.addTarget(self, action: #selector(deleteUser), for: .touchUpInside)
    }
    
    @objc func saveUser() {
        // Perform the user data update here
        let updatedFirstName = editScreenView.firstNameTextField.text ?? ""
        let updatedLastName = editScreenView.lastNameTextField.text ?? ""
        let updatedEmail = editScreenView.emailTextField.text ?? ""
        let updatedPhone = editScreenView.phoneTextField.text ?? ""
        
        // Update the user data in the database using DatabaseManager
        let databaseManager = DatabaseManager()
        let updated = databaseManager.updateUser(id: user.id, firstName: updatedFirstName, lastName: updatedLastName, email: updatedEmail, phone: updatedPhone)
        
        if updated {
            // Data updated successfully, navigate back to the previous screen
            navigationController?.popViewController(animated: true)
        } else {
            // Handle the case where the update failed, e.g., show an alert to the user
            let alert = UIAlertController(title: "Update Failed", message: "Failed to update user data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    @objc func deleteUser() {
        // Delete the user from the database using DatabaseManager
        let databaseManager = DatabaseManager()
        let deleted = databaseManager.deleteUser(id: user.id)
        
        if deleted {
            // User deleted successfully, navigate back to the previous screen
            navigationController?.popViewController(animated: true)
        } else {
            // Handle the case where the deletion failed, e.g., show an alert to the user
            let alert = UIAlertController(title: "Delete Failed", message: "Failed to delete user.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

