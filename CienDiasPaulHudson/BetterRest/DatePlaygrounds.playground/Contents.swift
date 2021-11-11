import UIKit
import Foundation

let now = Date()
let tomorrow = Date().addingTimeInterval(86400)
let range = now ... tomorrow
var components = DateComponents()
components.hour = 8
components.minute = 0
let date = Calendar.current.date(from: components) ?? Date()

var componentesOpcionales = DateComponents()
let hora = componentesOpcionales.hour ?? 0
let minuto = componentesOpcionales.minute ?? 0

let formatter = DateFormatter()
formatter.timeStyle = .medium
let dateString = formatter.string(from: Date())
formatter.timeStyle = .short
let dateMedium = formatter.twoDigitStartDate
formatter.timeStyle = .medium
formatter.timeStyle = .long


let componentes = Calendar.current.dateComponents([.hour,.minute], from: tomorrow)
let hour = componentes.hour ?? 0
let minute = componentes.minute ?? 0




