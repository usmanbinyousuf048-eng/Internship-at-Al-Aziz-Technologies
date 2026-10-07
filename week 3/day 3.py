import pandas as pd

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