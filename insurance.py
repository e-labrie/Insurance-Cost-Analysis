import pandas as pd

df = pd.read_csv('C:\\Users\\v-elabrie\\.vscode\\insurance\\insurance.csv')

# removing duplicates
df = df.drop_duplicates()

# removing outliers using IQR
data = df.copy()

def remove_outliers(data, column):
    Q1 = column.quantile(0.25)
    Q3 = column.quantile(0.75)
    IQR = Q3 - Q1
    data = data[~((column < (Q1 - 1.5 * IQR)) | (column > (Q3 + 1.5 * IQR)))]
    return data

charges = data['charges']
data = remove_outliers(data, charges)

bmi = data['bmi']
data = remove_outliers(data, bmi)

data.to_csv('insurance_clean.csv')