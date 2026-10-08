import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"

df = pd.read_csv(url)
#Initial Inspection of the data
print(df.shape)
print(df.info())
print(df.isna().sum())
print(df.duplicated().sum())
print(df.shape)
print(df.dtypes)


#only when analysis requires complete age column, else keep the NaN values.
# df['age']=df['age'].fillna(df['age'].median())
#fixing the missing values in Embarked column
df=df.dropna(subset=['Embarked'])
#fixing the missing values in cabin column
df["Cabin_Known"]=df["Cabin"].notna()
df=df.drop(columns=["Cabin"])

print(df["Cabin_Known"].value_counts())

#standardizing the string columns
df["Sex"] = df["Sex"].str.strip().str.lower()
df["Name"]= df["Name"].str.strip().str.lower()

#feature creation
df["FamilySize"] = df["SibSp"] + df["Parch"] + 1
df["IsAlone"]=df["FamilySize"]==1

#outlier detection
print(df["Fare"].describe())

#data validation after cleaning
print(df.isna().sum())
print(df.duplicated().sum())
print(df.shape)
print(df.dtypes)

#EDA
print("EDA")
print("Column Age's Mean: ", df['Age'].mean())
print("Column Age's Median: ", df['Age'].median())
print("Column Age's Mode: ", df['Age'].mode())
print("Column Age's Standard Deviation: ", df['Age'].std())
print("Column Age's Minimum: ", df['Age'].min())
print("Column Age's Maximum: ", df['Age'].max())
print("Column Age's 25th Percentile: ", df['Age'].quantile(0.25))
print("Column Age's 50th Percentile: ", df['Age'].quantile(0.50))
print("Column Age's 75th Percentile: ", df['Age'].quantile(0.75))

plt.hist(df["Age"],bins=20,edgecolor='darkblue')
plt.title("Distribution of Age")
plt.xlabel("Age")
plt.ylabel("Frequency")
plt.show()

print("Survival Rate by Sex:")
grpbysex=df.groupby("Sex")["Survived"].mean()*100
print(grpbysex)

grpbysex.plot(kind="bar",title="Survival Rate by Sex")
plt.show()

grpbyclass=df.groupby("Pclass")["Survived"].mean()*100
print("Survival Rate by Class:")
print(grpbyclass)

plt.figure()
grpbyclass.plot(kind="bar")
plt.title("Survival Rate by Passenger Class")
plt.xlabel("Passenger Class")
plt.ylabel("Survival Rate (%)")
plt.show()

plt.scatter(df["Age"],df["Fare"])
plt.xlabel("Age")
plt.ylabel("Fare")
plt.title("Age vs Fare")
plt.show()

plt.boxplot(df["Fare"])
plt.title("Fare Distribution")
plt.ylabel("Fare")
plt.show()

print(df["Age"].corr(df["Fare"]))

correlation_matrix = df.corr(numeric_only=True)
sns.heatmap(correlation_matrix, annot=True)
plt.title("Correlation Matrix")
plt.show()