//
//  EmployeeManager.swift
//  CoreDataDemo
//
//  Created by shubhan.langade on 28/02/23.
//

import Foundation
import CoreData

struct EmployeeManager{
    private let employeeDataRepository = EmployeeDataRepository()
   
    func createEmployee(employee : Employee){
        return employeeDataRepository.create(employee: employee)
    }
    func getAllEmployee() -> [Employee]?{
        return employeeDataRepository.getAll()
    }
    func getEmployee(byIdentifier id : UUID) -> Employee?{
        return employeeDataRepository.get(byIdentifier: id)
    }
    func updateEmployee(employee : Employee) -> Bool{
        return employeeDataRepository.update(employee: employee)
    }
    func deleteEmployee(record : Employee) -> Bool{
        return employeeDataRepository.delete(record: record)
    }
}
