library(ggplot2)

carat <- diamonds$carat
price <- diamonds$price

correlation <- cor(carat,price)

print(paste("Correlation between carat and price: ", correlation))


ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(color = "blue",
             shape = 17,
             size = 1,
             alpha = 0.7) +
  scale_x_continuous(expand = c(0,0.5)) +
  scale_y_continuous(expand = c(0.1, 0.1)) +
  labs(x = "Carat", y = "Price", title = "Scatterplot of carat vs price")

