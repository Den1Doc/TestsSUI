import SwiftUI

struct NavigationSplitStackView: View {
    @State var players = ["Dani", "Jamie", "Roy"]
    @State private var selectedPlayer: String?
    // MARK: - Visible in iPad layout
    var body: some View {
        NavigationSplitView {
            List(players, id: \.self, selection: $selectedPlayer, rowContent: Text.init)
        } detail: {
            Text(selectedPlayer ?? "Please choose a player")
        }

    }
}

struct Team: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var players: [String]
}

struct NavigationSplitStackView2: View {
    @State var teams = [
        Team(name: "My Team", players: ["Joe", "Mary", "Gwen"])
    ]
    @State private var selectedTeam: Team?
    @State private var selectedPlayer: String?
    // MARK: - Visible in iPad layout
    var body: some View {
        NavigationSplitView {
            List(teams, selection: $selectedTeam) { team in
                Text(team.name).tag(team)
            }
            .navigationSplitViewColumnWidth(250)
        } content: {
            List(selectedTeam?.players ?? [], id: \.self, selection: $selectedPlayer, rowContent: Text.init)
        } detail: {
            Text(selectedPlayer ?? "Please choose a player")
        }
        .navigationSplitViewStyle(.prominentDetail)

    }
}

struct NavigationSplitStackView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationSplitStackView()
            NavigationSplitStackView2()
                .previewDisplayName("nav split stack 2")
        }
    }
}
