import SwiftUI

struct TrendItem: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let unit: String
    let color: Color
    let symbol: String

    static let samples: [TrendItem] = [
        TrendItem(title: "活動", value: "113", unit: "大卡/天", color: .fitRed, symbol: "chevron.up"),
        TrendItem(title: "步行配速", value: "-/-", unit: "/公里", color: .fitPurple, symbol: "minus"),
        TrendItem(title: "距離", value: "3.0", unit: "公里/天", color: .fitBlue, symbol: "chevron.up"),
        TrendItem(title: "跑步配速", value: "-/-", unit: "/公里", color: .fitPink, symbol: "minus")
    ]
}

struct TrendsCard: View {
    let items: [TrendItem]
    private let columns = [GridItem(.flexible(), alignment: .leading),
                           GridItem(.flexible(), alignment: .leading)]

    var body: some View {
        CardContainer(title: "趨勢") {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items) { item in
                    TrendCell(item: item)
                }
            }
            .padding(.top, 4)
        }
    }
}

struct TrendCell: View {
    let item: TrendItem

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: item.symbol)
                .font(.system(size: 18, weight: .heavy))
                .foregroundStyle(item.color)
                .frame(width: 52, height: 52)
                .background(Color(.systemGray5), in: Circle())

            VStack(alignment: .leading, spacing: 0) {
                Text(item.title)
                    .font(.headline)
                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    Text(item.value)
                        .font(.title2.weight(.semibold))
                    Text(item.unit)
                        .font(.footnote.bold())
                }
                .foregroundStyle(item.color)
                .minimumScaleFactor(0.7)
                .lineLimit(1)
            }
        }
    }
}
