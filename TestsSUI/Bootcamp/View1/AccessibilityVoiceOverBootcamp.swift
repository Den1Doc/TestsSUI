import SwiftUI

struct AccessibilityVoiceOverBootcamp: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "On" : "Off")
                    }
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityHint("Double tap to toogle settings")
                    .accessibilityAction {
                        isActive.toggle()
                    }
                    
                } header: {
                    Text("Preferences")
                }
                
                
                Section {
                    
                    Button("Favorites") {
                        
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                    .accessibilityLabel("Favorites")
                    
                    Text("Favorites")
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                            
                        }
                    
                    
                } header: {
                    Text("Application")
                }
                
                
                VStack {
                    Text("Content")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                        .accessibilityAddTraits(.isHeader)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            
                            ForEach(0..<10) { x in
                                VStack {
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .padding()
                                    Text("Item \(x)")
                                }
                                .onTapGesture {
                                    
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityAddTraits(.isButton)
                                .accessibilityLabel("Item \(x). Image heart")
                                .accessibilityHint("Double tap to open")
                                .accessibilityAction {
                                    
                                }
                            }
                            
                        }
                    }
                    
                }
                
            }
            .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    AccessibilityVoiceOverBootcamp()
}
