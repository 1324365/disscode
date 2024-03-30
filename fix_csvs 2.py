# %%
import csv
FILENAMES = ["JOM 301passive"] #fill in all of the files here

for filename in FILENAMES:
    with open(filename + ".csv", "r") as f, open(filename + "_fixed.csv", mode="w", newline='') as new:
        c = csv.DictReader(f, delimiter=',')
        x = list(c)
        for r in x:
            if r['Action']=='Saved drawing data':
                r['x value'] = r['x value'] + "." + r['y value']
                r['y value'] = r["QuestionnairesValues"] + "." + r['']
                r['QuestionnairesValues'] = ''
                r[''] = ''

        writer = csv.DictWriter(new, fieldnames=c.fieldnames)
        writer.writeheader()
        for r in x:
            writer.writerow(r)
    
# %%
