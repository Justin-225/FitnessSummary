# #2 模仿上架 APP 的精美頁面

> 撰寫前請先把所有 `【】` 標記的地方換成你自己的內容或圖片。

我模仿的 App 是 Apple 的「健身」（Fitness），是 iPhone 內建的運動紀錄 App，可以看活動圓圈、步數、訓練紀錄和獎章，也能試用 Fitness+ 的訓練課程。我模仿的是它的「**摘要**」頁，畫面是這樣組成的：最上方是大標題「摘要」、日期和大頭貼；下面依序是活動記錄圓圈卡片、步數與步行距離兩張並排卡片、訓練與獎章兩張並排卡片、Fitness+ 大圖卡片、趨勢卡片、教練小秘訣卡片，最後是「編輯摘要」「查看所有類別」兩個按鈕；最下方是浮在內容上的四個按鈕 Tab Bar（摘要、Fitness+、體能訓練、分享）。

【圖片：原版摘要頁截圖，放在這裡】

【圖片：模仿版摘要頁截圖（深色模式），放在這裡】

【連結：GitHub 專案網址】　【連結：Demo 影片網址】

## 要求使用的元件

| 元件 | 用在哪裡 |
|---|---|
| Text | 幾乎每個檔案，例如 `MetricCard.swift`、`TrendsCard.swift` |
| Image | `AssetImage.swift`（Assets 圖片）、`HeaderView.swift`（大頭貼） |
| SF Symbol | `WorkoutCard.swift` 的跑步圖示、`TrendsCard.swift` 的箭頭、`FloatingTabBar.swift` 的圖示 |
| VStack | `ContentView.swift` 垂直排列所有卡片、`CardContainer.swift` |
| HStack | `ContentView.swift` 的並排卡片、`HeaderView.swift` |
| ZStack | `ContentView.swift`（捲動內容在下、Tab Bar 在上）、`FitnessPlusCard.swift`（圖片、漸層、文字疊在一起）、`ActivityRingCard.swift`（圓圈疊箭頭） |
| ScrollView | `ContentView.swift`，讓整頁可以上下捲動 |

其他：使用 `Color` 的 asset 與系統語意色做出淺色 / 深色兩種模式（加分項目）。

## 程式碼解釋與畫面比較

為了避免篇幅太長，程式碼大致講解就好。

**CardContainer.swift**：所有卡片共用的外框，用 property 傳入標題，並用 `@ViewBuilder` 讓每張卡片放不同內容；右上角的灰色圓形箭頭是 `ChevronBadge`。
【圖片：原版 vs 模仿版 — 任一張卡片的外框】

**HeaderView.swift**：左邊是大標題與日期，右邊是圓形大頭貼，圖片來自 asset，沒有圖片時顯示 SF Symbol。
【圖片：原版 vs 模仿版 — 頁面頂部】

**ActivityRingCard.swift**：左邊用兩個 `Circle` 疊起來畫活動圓圈（底圈半透明、上層用 `trim` 畫進度），圓圈上方放紅色膠囊箭頭，右邊顯示「15/300 大卡」。
【圖片：原版 vs 模仿版 — 活動記錄圓圈】

**MetricCard.swift ＆ HourlyBarChart.swift**：步數與步行距離共用同一個 view，用 property 傳入標題、數值、單位、顏色；下方 24 小時的細線圖表用 `ForEach` 畫出。
【圖片：原版 vs 模仿版 — 步數與步行距離】

**WorkoutCard.swift ＆ MedalCard.swift**：訓練卡片是綠色跑步圖示加距離文字；獎章卡片放獎章圖片與說明。
【圖片：原版 vs 模仿版 — 訓練與獎章】

**FitnessPlusCard.swift**：用 `ZStack` 把大圖、黑色漸層和文字疊起來，再切成圓角，下方是 5 個頁碼圓點。
【圖片：原版 vs 模仿版 — Fitness+ 大圖卡片】

**TrendsCard.swift**：定義 `TrendItem` 資料型別，用 `LazyVGrid` 排成兩欄，每一格是圓形箭頭加標題與數值。
【圖片：原版 vs 模仿版 — 趨勢】

**CoachTipCard.swift ＆ ActionButton.swift**：教練小秘訣卡片與兩個綠色文字膠囊按鈕。
【圖片：原版 vs 模仿版 — 頁面底部】

**FloatingTabBar.swift**：定義 `FitnessTab` enum，用 `ForEach` 產生四個項目，選到的項目有淡色膠囊背景與綠色文字，整條用 `.ultraThinMaterial` 做出半透明效果。
【圖片：原版 vs 模仿版 — 底部 Tab Bar】

**ContentView.swift**：整頁的組合，把所有卡片放進 `ScrollView` 的 `VStack`，並排的卡片用 `HStack` 加 `.fixedSize(horizontal: false, vertical: true)` 讓高度一致，最外層用 `ZStack` 讓 Tab Bar 浮在最上面。
【圖片：淺色模式 vs 深色模式 的完整畫面】

## Assets 圖片清單

| Asset 名稱 | 用途 | 建議尺寸 |
|---|---|---|
| `avatar` | 右上角大頭貼 | 300 × 300 px |
| `fitnessHero` | Fitness+ 大圖卡片背景 | 1200 × 700 px |
| `coach` | 教練小秘訣的教練頭像 | 300 × 300 px |
| `medal` | 獎章圖片（透明背景 png） | 400 × 400 px |

## 心得

【請寫你自己的心得，可以參考這幾個方向：哪個部分最難還原（例如活動圓圈、浮動 Tab Bar）、原 App 的圖示和字型跟 SF Symbol 的差異、用 AI 分析截圖得到的數值哪裡不準需要自己微調、學到什麼 SwiftUI 技巧。】
