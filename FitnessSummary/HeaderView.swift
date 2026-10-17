import SwiftUI

struct HeaderView: View {
    let title: String
    let dateText: String

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(.largeTitle.bold())
                Text(dateText)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            AssetImage(name: "avatar", fallbackSymbol: "person.fill")
                .frame(width: 46, height: 46)
                .clipShape(Circle())
                .padding(4)
                .background(Color.cardBackground, in: Circle())
        }
        .padding(.top, 8)
    }
}
