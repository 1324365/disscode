# Read data from CSV files

data1 <- read.csv("/Users/laurahurn/Desktop/diss/data/active /ali/corr_resultsperxrt.csv", header = FALSE)
data2 <- read.csv("/Users/laurahurn/Desktop/diss/data/active /ali/corr_resultsmwxrt.csv",header = FALSE)
data3 <- read.csv("/Users/laurahurn/Desktop/diss/data/active /ali/corr_resultsmwxCRT.csv",header = FALSE)
data4 <- read.csv("/Users/laurahurn/Desktop/diss/data/active /ali/corr_resultsperxCRT.csv",header = FALSE)
data5 <- read.csv("/Users/laurahurn/Desktop/diss/data/active /ali/corr_results_perxmw.csv",header = FALSE)

# Create and save the first plot
plot1 <- ggplot(data1, aes(x = "", y = V1, fill = "Data1")) +
  geom_violin() +
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) + # Add boxplot for better visualization
  geom_jitter(width = 0.2, color = "black") + # Add data points with jitter
  theme_minimal() +
  labs(x = NULL, y = "Values", title = "RT performance participant9")
ggsave("RT_performance_plot.png", plot1)

# Create and save the second plot
plot2 <- ggplot(data2, aes(x = "", y = V1, fill = "Data2")) +
  geom_violin() +
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) + # Add boxplot for better visualization
  geom_jitter(width = 0.2, color = "black") + # Add data points with jitter
  theme_minimal() +
  labs(x = NULL, y = "Values", title = "RT MW participant 9")
ggsave("RT_MW_plot.png", plot2)

# Create and save the third plot
plot3 <- ggplot(data3, aes(x = "", y = V1, fill = "Data3")) +
  geom_violin() +
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) + # Add boxplot for better visualization
  geom_jitter(width = 0.2, color = "black") + # Add data points with jitter
  theme_minimal() +
  labs(x = NULL, y = "Values", title = "var RT MW participanr 9 ")
ggsave("varRT_MW_plot.png", plot3)

# Create and save the fourth plot
plot4 <- ggplot(data4, aes(x = "", y = V1, fill = "Data4")) +
  geom_violin() +
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) + # Add boxplot for better visualization
  geom_jitter(width = 0.2, color = "black") + # Add data points with jitter
  theme_minimal() +
  labs(x = NULL, y = "Values", title = "var RT per participant 9")
ggsave("varRT_per_plot.png", plot4)


# Create and save the fourth plot
plot5 <- ggplot(data5, aes(x = "", y = V1, fill = "Data4")) +
  geom_violin() +
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) + # Add boxplot for better visualization
  geom_jitter(width = 0.2, color = "black") + # Add data points with jitter
  theme_minimal() +
  labs(x = NULL, y = "Values", title = "MWxPER per participant 9")
ggsave("mw_per_plot.png", plot5)

