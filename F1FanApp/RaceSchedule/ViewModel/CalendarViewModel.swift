//
//  CalendarViewModel.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 23/01/2023.
//

import Foundation
import EventKit
import EventKitUI

class CalendarViewModel: NSObject, ObservableObject {
    @objc private let eventStore = EKEventStore()
    @objc private var eventEditViewController: EKEventEditViewController?
    // Other properties
    
    func addEventToCalendar(_ race: Race) {
        switch EKEventStore.authorizationStatus(for: .event) {
        case .notDetermined:
            eventStore.requestAccess(to: .event) { (granted, error) in
                if granted {
                    self.createEvent(race)
                } else {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Permission Denied", message: "Please enable permissions in settings to add event to calendar.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        if let viewController = UIApplication.shared.windows.first?.rootViewController {
                            viewController.present(alert, animated: true)
                        }
                    }
                }
            }
        case .authorized:
            createEvent(race)
        case .restricted, .denied:
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Permission Denied", message: "Please enable permissions in settings to add event to calendar.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                if let viewController = UIApplication.shared.windows.first?.rootViewController {
                    viewController.present(alert, animated: true)
                }
            }
            break
        @unknown default:
            fatalError()
        }
    }
    
    private func createEvent(_ race: Race) {
        DispatchQueue.main.async {
            let event = EKEvent(eventStore: self.eventStore)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"

            //set properties, change to race values after new sezon
            event.title = race.raceName
            event.startDate = dateFormatter.date(from: "20.07.2023")
            event.endDate = event.startDate.addingTimeInterval(3600)
            event.calendar = self.eventStore.defaultCalendarForNewEvents
            
            
            //Create CLLocation
            let location = CLLocation(latitude: Double(race.circuit.location.lat) ?? 0.0, longitude: Double(race.circuit.location.long) ?? 0.0)
            event.location = "\(race.circuit.location.locality), \(race.circuit.location.country)"
            event.structuredLocation = EKStructuredLocation(title: event.location ?? "Poland")
            event.structuredLocation?.geoLocation = location

            self.eventEditViewController = EKEventEditViewController()
            self.eventEditViewController?.event = event
            self.eventEditViewController?.eventStore = self.eventStore
            self.eventEditViewController?.editViewDelegate = self
            // Save event to calendar
            do {
                try self.eventStore.save(event, span: .thisEvent)
                print("Event saved")
            } catch {
                print("Error saving event: \(error)")
            }
        }
    }
}

extension CalendarViewModel: EKEventEditViewDelegate {
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        switch action {
        case .canceled:
            print("Cancelled")
        case .saved:
            print("Saved")
        case .deleted:
            print("Deleted")
        @unknown default:
            fatalError()
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
