import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.pageBackground.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 10) {
                    HeaderView(title: "摘要", dateText: "10月17日星期六")
                        .padding(.bottom, 14)

                    ActivityRingCard(current: 15, goal: 300)

                    HStack(spacing: 10) {
                        MetricCard(title: "步數", value: "670", color: .fitPurple)
                        MetricCard(title: "步行距離", value: "0.48", unit: "公里", color: .fitBlue)
                    }
                    .fixedSize(horizontal: false, vertical: true)

                    HStack(spacing: 10) {
                        WorkoutCard(name: "室外跑步", distance: "1.22公里", day: "星期四")
                        MedalCard(caption: "最長的跑步訓練", detail: "2.81公里")
                    }
                    .fixedSize(horizontal: false, vertical: true)

                    FitnessPlusCard()

                    TrendsCard(items: TrendItem.samples)

                    HStack(spacing: 10) {
                        CoachTipCard()
                        Color.clear.frame(maxWidth: .infinity)
                    }
                    .fixedSize(horizontal: false, vertical: true)

                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 0.5)
                        .padding(.vertical, 14)

                    ActionButton(title: "編輯摘要")
                    ActionButton(title: "查看所有類別")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 120)   // 留空間給底部浮動 Tab Bar
            }

            FloatingTabBar(selected: .summary)
        }
    }
}

#Preview("Dark") {
    ContentView().preferredColorScheme(.dark)
}

#Preview("Light") {
    ContentView().preferredColorScheme(.light)
}
