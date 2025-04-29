import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
import seaborn as sns


file_path = r'D:\Data Analysis\4. Mall Data Analysis\customer_sales_summary.csv'
df = pd.read_csv(file_path)

df = df.dropna(subset=['age', 'total_spend'])

X = df[['age', 'total_spend']]

kmeans = KMeans(n_clusters=4, random_state=0)
kmeans.fit(X)

# Add Cluster Labels
df['customer_segment'] = kmeans.labels_

# Save Output
output_path = r'D:\Data Analysis\4. Mall Data Analysis\segmented.csv'  
df.to_csv(output_path, index=False)

# Optional Visualization
plt.figure(figsize=(8,5))
sns.scatterplot(data=df, x='age', y='total_spend', hue='customer_segment', palette='viridis')
plt.title('Customer Segments based on Age and Spend')
plt.xlabel('Age')
plt.ylabel('Total Spend')
plt.legend(title='Segment')
plt.show()