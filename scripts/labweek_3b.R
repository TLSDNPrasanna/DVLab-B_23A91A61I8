# ── airquality Bar Charts ────────────────────────────────────────────────────
data(airquality)
library(ggplot2)
library(tidyr)

# Convert Month to factor
airquality$Month <- factor(airquality$Month, labels = c("May","Jun","Jul","Aug","Sep"))

# ── Base R ───────────────────────────────────────────────────────────────────

# 1. Count bar chart
barplot(table(airquality$Month),
        main = "Observations per Month", xlab = "Month", ylab = "Count",
        col = "lightblue")

# 2. Aggregated bar chart (mean ozone)
mean_ozone <- tapply(airquality$Ozone, airquality$Month, mean, na.rm = TRUE)
barplot(mean_ozone,
        main = "Mean Ozone by Month", xlab = "Month", ylab = "Mean Ozone (ppb)",
        col = "orange")

# 3. Grouped bar chart (beside = TRUE)
group_means <- rbind(
  Ozone = tapply(airquality$Ozone,   airquality$Month, mean, na.rm = TRUE),
  Solar = tapply(airquality$Solar.R, airquality$Month, mean, na.rm = TRUE) / 10
)
barplot(group_means, beside = TRUE, col = c("skyblue","pink"),
        legend.text = TRUE, main = "Grouped: Ozone vs Solar (scaled)")

# 4. Stacked bar chart (beside = FALSE)
barplot(group_means, beside = FALSE, col = c("skyblue","pink"),
        legend.text = TRUE, main = "Stacked: Ozone vs Solar (scaled)")

# ── ggplot2 ──────────────────────────────────────────────────────────────────

# 5. Count bar chart
ggplot(airquality, aes(x = Month)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Observations per Month", y = "Count") +
  theme_minimal()

# 6. Aggregated bar chart (stat_summary)
ggplot(airquality, aes(x = Month, y = Ozone)) +
  stat_summary(fun = mean, geom = "bar", fill = "orange", na.rm = TRUE) +
  labs(title = "Mean Ozone by Month", y = "Mean Ozone (ppb)") +
  theme_minimal()

# 7. Grouped bar chart
ggplot(airquality, aes(x = Month, y = Ozone, fill = Month)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge", na.rm = TRUE) +
  labs(title = "Grouped Mean Ozone by Month") +
  theme_minimal()

# 8. Stacked bar chart (long format)
airquality_long <- pivot_longer(airquality, cols = c(Ozone, Solar.R),
                                names_to = "Measure", values_to = "Value")

ggplot(airquality_long, aes(x = Month, y = Value, fill = Measure)) +
  stat_summary(fun = mean, geom = "bar", position = "stack", na.rm = TRUE) +
  labs(title = "Stacked: Mean Ozone & Solar Radiation") +
  theme_minimal()