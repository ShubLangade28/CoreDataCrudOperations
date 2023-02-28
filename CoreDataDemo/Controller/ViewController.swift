//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by shubhan.langade on 27/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var empName: UITextField!
    @IBOutlet weak var empEmail: UITextField!
    let manager = EmployeeManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Employee"
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
        // Do any additional setup after loading the view.
    }

    @IBAction func createButtonTapped(_ sender: Any) {
        manager.createEmployee(employee: Employee(name: empName.text, email: empEmail.text, profilePicture: employeeImage.image?.pngData(), id: UUID()))
        let allEmployeeVC = storyboard?.instantiateViewController(withIdentifier: "AllEmployeeViewController") as! AllEmployeeViewController
        navigationController?.pushViewController(allEmployeeVC, animated: true)
    }
    
    @IBAction func readButtonTapped(_ sender: Any) {
        let allEmployeeVC = storyboard?.instantiateViewController(withIdentifier: "AllEmployeeViewController") as! AllEmployeeViewController
        navigationController?.pushViewController(allEmployeeVC, animated: true)
    }
}

