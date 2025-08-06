import mysql.connector
#connection to server
mydb = mysql.connector.connect(
    host="localhost",
    user="JasonB",
    password="JasB102070_MySQL",
    database="incidents"
)
cursor = mydb.cursor()
#gather user input
incident_id = int(input("Enter Incident ID: "))
badge_number = int(input("Enter Officer Badge Number: "))
citizen_id = int(input("Enter Citizen ID: "))
license_plate = input("Enter Car License Plate: ")
incident_type = input("Enter Incident Type: ")
date_str = input("Enter Date (YYYY-MM-DD): ")
weapon_used_str = input("Was a weapon used? (TRUE/FALSE): ")

# Convert weapon_used_str to boolean/int
weapon_used = 1 if weapon_used_str.strip().upper() == "TRUE" else 0
#run sql dml
sql = """
    INSERT INTO INCIDENT (IncidentId, BadgeNumber, Id, License, Type, Date, WeaponUsed)
    VALUES (%s, %s, %s, %s, %s, %s, %s)
"""
values = (incident_id, badge_number, citizen_id, license_plate, incident_type, date_str, weapon_used)
#commit
cursor.execute(sql, values)
mydb.commit()

print("Inserted successfully")

cursor.close()
mydb.close()
