//
//  DetailViewController.swift
//  CoreDataDemo
//
//  Created by shubhan.langade on 28/02/23.
//

import UIKit

class DetailViewController: UIViewController {
    let manager = EmployeeManager()

    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var employeeName: UITextField!
    @IBOutlet weak var employeeEmail: UITextField!
    
    var employee : Employee?
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeImage.image = UIImage(data: (employee?.profilePicture)!)
        employeeName.text = employee?.name
        employeeEmail.text = employee?.email
    }
    @IBAction func updateButtonTapped(_ sender: Any) {
        manager.updateEmployee(employee: Employee(name: employeeName.text, email: employeeEmail.text, profilePicture: employeeImage.image?.pngData(), id: employee!.id))
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        manager.deleteEmployee(record: Employee(name: employee?.name, email: employee?.email, profilePicture: employee?.profilePicture, id: employee!.id))
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
