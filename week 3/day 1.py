students = [
    {"name": "Ali", "age": 20, "marks": 78, "status": ""},
    {"name": "Sara", "age": 21, "marks": 92, "status": ""},
    {"name": "Ahmed", "age": 19, "marks": 65, "status": ""},
    {"name": "Ayesha", "age": 22, "marks": 88, "status": ""},
    {"name": "Hamza", "age": 20, "marks": 55, "status": ""}
]

for student in students:
    print(student["name"]) 

avg=sum(student["marks"] for student in students) / len(students)
print("Average marks:", avg)
for student in students:
    if student["marks"] >= 70:
        print(student["name"])

highest=max(students, key=lambda x: x["marks"])
print("Highest marks:", highest["name"], highest["marks"])

for s in students:
    s["status"] = "Pass" if s["marks"] >= 60 else "Fail"

sales = [1200, 850, 2300, 1750, 950, 3100, 1450]
print("Task 2")
total_sales = sum(sales)
print("Total sales:", total_sales)
average_sales = round(total_sales / len(sales), 2)
print("Average sales:", average_sales)
highest_sale = max(sales)
print("Highest sale:", highest_sale)
minimum_sale = min(sales)
print("Minimum sale:", minimum_sale)
above_average_sales = [sale for sale in sales if sale > average_sales]
print("Above average sales:", above_average_sales)

def calculate_average(numbers):
    if not numbers:
        return None
    return sum(numbers) / len(numbers)

print(calculate_average([10, 20, 30, 40]))
print(calculate_average([]))