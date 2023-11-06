import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv('EnrichedLayer_0.csv')

# -------------------------------------------------------------

df['Education percentage'] = (df['2023 Pop 25+/Edu: Primary'] + df['2023 Pop 25+/Edu: Secondary'] + df['2023 Pop 25+/Edu: University and Other Related']) / df['2021 Total Population']

df['Male percentage'] = df['2023 Total Male Population'] / df['2021 Total Population']

df['Female percentage'] = df['2023 Total Female Population'] / df['2021 Total Population']

df.to_csv('EnrichedLayer_1.csv', index=False)

# -------------------------------------------------------------

df1 = pd.read_csv('./TZA_2019_NPD-SDD_v06_M_CSV/HH_SEC_A.csv')
df2 = pd.read_csv('./TZA_2019_NPD-SDD_v06_M_CSV/HH_SEC_M.csv')

merged_df = pd.merge(df1, df2, on='sdd_hhid')

merged_df = merged_df[['sdd_hhid','hh_a01_1','itemcode','hh_m01', 'sdd_rural', 'domain']]

technology_set = {'RADIO AND RADIO CASSETTE', 'TELEPHONE(LANDLINE)', 'TELEPHONE(MOBILE)', 'REFRIDGERATOR OR FREEZER', 'TELEVISION', 'COMPUTER', \
                  'ELECTRIC/GAS STOVE', 'WATER-HEATER', '"RECORD/CASSETTE PLAYER, TAPE RECORDER"', 'COMPLETE MUSIC SYSTEM', 'FAN/AIR CONDITIONER', \
                  'DISH ANTENA/DECODER', 'COFFEE PULPING MACHINE'}

merged_df = merged_df[(merged_df['hh_m01'] != 0) & merged_df['itemcode'].isin(technology_set)]

tech_avg = merged_df.groupby('hh_a01_1').apply(lambda x: x.groupby('sdd_hhid')['hh_m01'].sum().mean()).reset_index()
tech_avg.columns = ['hh_a01_1', 'technology per household']

tech_avg.to_csv('tech_avg.csv', index=False)

df = pd.read_csv('tech_avg.csv')

categories = df['hh_a01_1']
values = df['technology per household']

sorted_indices = np.argsort(values)[::1]
sorted_categories = [categories[i] for i in sorted_indices]
sorted_values = [values[i] for i in sorted_indices]

colors = plt.cm.RdYlBu(np.linspace(0, 1, len(sorted_categories)))

plt.figure(figsize=(8, 6))

bars = plt.barh(sorted_categories, sorted_values, color=colors)

plt.xlabel('Technology Per Household')
plt.ylabel('Province')
plt.title('Technology')

plt.show()
