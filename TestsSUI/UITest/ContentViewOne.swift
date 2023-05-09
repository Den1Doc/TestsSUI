import SwiftUI

class UITestViewModel: ObservableObject {
    
    let placeholderText: String = "Add u name..."
    @Published var textFieldText: String = ""
    @Published var currentUser: Bool = false
    
    func singUpButtonPressed() {
        guard !textFieldText.isEmpty else {return}
        currentUser = true
    }
    
}

struct ContentViewOne: View {
    @StateObject var vm = UITestViewModel()
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            ZStack {
                if vm.currentUser {
                    SignInHomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))
                }
                if !vm.currentUser {
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
            
        }
        
    }
}

struct ContentViewOne_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewOne()
    }
}

extension ContentViewOne {
    private var signUpLayer: some View {
        VStack{
            TextField(vm.placeholderText, text: $vm.textFieldText)
                .font(.headline)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .accessibilityIdentifier("SignUpTextField")
            
            Button {
                withAnimation(.spring()) {
                    vm.singUpButtonPressed()
                }
            } label: {
                Text("Sing UP")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.blue.cornerRadius(10))
                    .accessibilityIdentifier("SingUpButton")
            }
            
            
        }
        .padding()
    }
}


struct SignInHomeView: View{
    @State private var showAlert: Bool = false
    var body: some View {
        Text("hello, world!")
        NavigationView {
            VStack(spacing: 20.0){
                
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Show welcom alter")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                    
                }
                .alert(isPresented: $showAlert) {
                    return Alert(title: Text("Welcom to the app!"))
                }
                
                
                NavigationLink(destination: Text("Destination"), label: {
                    Text("Navigate")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
            }
            .padding()
            .navigationTitle("Welcom!")
        }
    }
}
