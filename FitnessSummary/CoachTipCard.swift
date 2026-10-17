import SwiftUI

struct CoachTipCard: View {
    var headline = "健身教練常分享的肌力訓練原則"
    var credit = "由 Fitness+ 教練 Jenn 提供"

    var body: some View {
        CardContainer(title: "教練小秘訣", showsChevron: false) {
            Text(headline)
                .font(.headline)

            Spacer(minLength: 0)

            HStack(spacing: 10) {
                AssetImage(name: "coach", fallbackSymbol: "person.fill")
                    .frame(width: 46, height: 46)
                    .clipShape(Circle())
                Text(credit)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
