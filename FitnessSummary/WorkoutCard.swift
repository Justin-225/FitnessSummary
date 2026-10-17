import SwiftUI

struct WorkoutCard: View {
    let name: String
    let distance: String
    let day: String

    var body: some View {
        CardContainer(title: "訓練") {
            Image(systemName: "figure.run")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(Color.fitLime)
                .frame(width: 44, height: 44)
                .background(Color.fitLime.opacity(0.15), in: Circle())

            Text(name)
                .font(.title3)

            Text(distance)
                .font(.system(size: 34, weight: .semibold))
                .foregroundStyle(Color.fitLime)
                .minimumScaleFactor(0.6)
                .lineLimit(1)

            Spacer(minLength: 0)

            Text(day)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
