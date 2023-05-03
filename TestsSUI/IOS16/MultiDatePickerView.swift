import SwiftUI

struct MultiDatePickerView: View {
    @State private var dates = Set<DateComponents>()
    @Environment(\.calendar) var calendar
    var body: some View {
        VStack {
            MultiDatePicker("Выбор даты", selection: $dates)
            Text(sum)
        }
    }
        var sum: String {
            dates.compactMap { compact in
                calendar.date(from: compact)?.formatted(date: .long, time: .omitted)
            }.formatted()
        }
        
    
}

struct MultiDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiDatePickerView()
    }
}
