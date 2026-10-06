import pandas as pd

url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"

df = pd.read_csv(url)

print(df.head())
print(df.shape)
print(df.info())
print(df.isna().sum())
print(df.describe())
filter= df[(df['Survived'] == True) & (df['Pclass'] == 1)]
print(filter)
df["Family Size"]= df["SibSp"] + df["Parch"] + 1
print(df[["Name", "Family Size"]].head())
avg=df.groupby("Pclass")["Fare"].mean()
print(avg)
top_fares = df.sort_values("Fare", ascending=False).head(10)
print(top_fares[["Name", "Pclass", "Fare"]])
