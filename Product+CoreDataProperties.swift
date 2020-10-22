//
//  Product+CoreDataProperties.swift
//  Asagohanya
//
//  Created by 王冠之 on 2020/10/21.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var price: Double

}

extension Product : Identifiable {

}
