import SwiftUI
import GetStream
import GetStreamActivityFeed

struct ContentView: View {
    @State var username: String = ""
    @EnvironmentObject var account: Account
    
    func login() {
        account.login(username)
    }
    
    var body: some View {
        HStack() {
            if account.isLoggedIn {
                TabView {
                    FeedView()
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Timeline")
                    }
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                    }
                }
            } else {
                VStack(alignment: .leading) {
                    Text("Type a username to log in")
                        .font(.headline)
                    TextField("Type a username", text: $username, onCommit: login)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: login) { Text("Login") }
                        .frame(maxWidth: .infinity, maxHeight: 35)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                }.padding()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}