//
//  AllEmployeeViewController.swift
//  CoreDataDemo
//
//  Created by shubhan.langade on 28/02/23.
//

import UIKit

class AllEmployeeViewController: UIViewController {
    @IBOutlet weak var allEmployeeTable: UITableView!
    let manager = EmployeeManager()
    var allEmployee = [Employee]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Employee"
        allEmployeeTable.delegate = self
        allEmployeeTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        allEmployee = manager.getAllEmployee()!
        allEmployeeTable.reloadData()
    }
}

extension AllEmployeeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allEmployee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeCell = allEmployeeTable.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeCell
        employeeCell.employeeImage.image = UIImage(data: allEmployee[indexPath.row].profilePicture!)
        employeeCell.employeeName.text = allEmployee[indexPath.row].name
        employeeCell.employeeEmail.text = allEmployee[indexPath.row].email
        return employeeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVc.employee = allEmployee[indexPath.row]
        navigationController?.pushViewController(detailVc, animated: true)
    }
}
