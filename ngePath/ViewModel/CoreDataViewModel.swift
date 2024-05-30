import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [Place] = []
    
    init() {
        container = NSPersistentContainer(name: "SaveUserPlaces")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data: \(error)")
            } else {
                print("Successfully loaded Core Data")
            }
        }
        
        fetchPlace()
    }
    
    func fetchPlace() {
        let request = NSFetchRequest<Place>(entityName: "Place")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
            // Print the fetched data
            printPlaces()
        } catch let error {
            print("Error fetching data: \(error)")
        }
    }

    func printPlaces() {
        for place in savedEntities {
            print("Place Name: \(place.placeName ?? "Unknown")")
            print("Set Place Name: \(place.setPlaceName ?? "Unknown")")
            print("Longitude: \(place.longitude)")
            print("Latitude: \(place.lattitude)")
            print("-----")
        }
    }
    
    func addPlace(placeName: String, setPlaceName: String?, longitude: Double, lattitude: Double) {
        let newPlace = Place(context: container.viewContext)
        newPlace.placeName = placeName
        newPlace.setPlaceName = setPlaceName ?? placeName
        newPlace.longitude = longitude
        newPlace.lattitude = lattitude
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchPlace()
        } catch let error {
            print("Error saving data: \(error)")
        }
    }
}
