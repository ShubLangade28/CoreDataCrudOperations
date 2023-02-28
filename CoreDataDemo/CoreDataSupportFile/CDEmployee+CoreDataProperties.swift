//
//  CDEmployee+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by shubhan.langade on 27/02/23.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var email: String?
    @NSManaged public var profilePic: Data?

}

extension CDEmployee : Identifiable {

}
