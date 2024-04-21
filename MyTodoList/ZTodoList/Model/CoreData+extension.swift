

import Foundation
import CoreData


extension TODOListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TODOListItem> {
        return NSFetchRequest<TODOListItem>(entityName: "TODOListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension TODOListItem : Identifiable {

}
