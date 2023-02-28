//
//  EmployeeDataRepository.swift
//  CoreDataDemo
//
//  Created by shubhan.langade on 27/02/23.
//

import Foundation
import CoreData

protocol EmployeeRepository{
    func create(employee : Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id : UUID) -> Employee?
    func update(employee : Employee) -> Bool
    func delete(record : Employee) -> Bool
}

struct EmployeeDataRepository : EmployeeRepository{
    func create(employee: Employee) {
        let cdEmployee = CDEmployee(context: PersistantStorage.shared.context)
        cdEmployee.name = employee.name
        cdEmployee.email = employee.email
        cdEmployee.id = employee.id
        cdEmployee.profilePic = employee.profilePicture
        PersistantStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        var employee = [Employee]()
        do{
            guard let result = try PersistantStorage.shared.context.fetch(CDEmployee.fetchRequest()) as? [CDEmployee] else{return nil}
            for cdEmployee in result{
                employee.append(Employee(name: cdEmployee.name, email: cdEmployee.email, profilePicture: cdEmployee.profilePic, id: cdEmployee.id!))
            }
        }catch let error{
            print(error.localizedDescription)
        }
        
        return employee
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        var employee : Employee?
        
        let result = getCdEmployee(byIdentifier: id)
        employee = Employee(name: result?.name, email: result?.email, profilePicture: result?.profilePic, id: (result?.id)!)
        return employee
    }
    
    func update(employee: Employee) -> Bool {
        let cdEmployee = getCdEmployee(byIdentifier: employee.id)
        if cdEmployee != nil{
            cdEmployee?.email = employee.email
            cdEmployee?.name = employee.name
            cdEmployee?.profilePic = employee.profilePicture
            
            PersistantStorage.shared.saveContext()
            return true
        }else{
            return false
        }
    }
    
    func delete(record: Employee) -> Bool {
        let cdEmployee = getCdEmployee(byIdentifier: record.id)
        if cdEmployee != nil{
            PersistantStorage.shared.context.delete(cdEmployee!)
            PersistantStorage.shared.saveContext()
            return true
        }else{
            return false
        }
    }
    
    private func getCdEmployee(byIdentifier id : UUID) -> CDEmployee?{
        var cdEmployee : CDEmployee?
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do{
            let result = try PersistantStorage.shared.context.fetch(fetchRequest).first
            cdEmployee = result
        }catch let error{
            print(error.localizedDescription)
        }
        return cdEmployee
    }
    
    
}
