# ###Classes / Objects
# class Char:
#     def __init__(self, name, age, AD):
#         self.name = name
#         self.age = age
#         self.AD = AD
#     def punch(self):
#         print("Dealt", self.AD, "damage")
#     def kick(self):
#         print("Dealt", self.AD*2, "damage")
#     def showInfo(self):
#         print([self.name, self.age, self.AD])
# Huy = Char("Huy", 50, 50)
# Huy.showInfo()

# ###Inheritance
# class Warrior(Char):
#     def __init__(self, name, age, AD, weapon):
#         super().__init__(name, age, AD)
#         self.weapon = weapon


###Bai tap thuc hanh

class Employee:
    def __init__(self,name,age):
        self.name = name
        self.age = age
    def Info(self):
        print([self.name, self.age])

class FullTime(Employee):
    def __init__(self, name, age, basic_salary, salary_multiplier):
        super().__init__(name, age)     
        self.basic_salary = basic_salary
        self.salary_multiplier = salary_multiplier
    # def Name(self):
    #     return self.name
    def calcSalary(self):
        print("Offical salary: ", self.basic_salary*self.salary_multiplier)

class PartTime(Employee):
    def __init__(self, name, age, hours_worked, hourly_rate):
        super().__init__(name, age)
        self.hours_worked = hours_worked
        self.hourly_rate = hourly_rate
    # def Name(self):
    #     return self.name
    def calcSalary(self):
        print("Offical salary:", self.hours_worked * self.hourly_rate)
        
class Department:
    def __init__(self, name):
        self.name = name
        self.employees = []

    def Hire(self, employee):
        self.employees.append(employee.name)
        print("Hired",employee.name)

    def Fire(self, employee):
        if employee.name in self.employees:
            self.employees.remove(employee.name)
            print("Fired",employee.name)
        else: print("No employees with that name")

    def List_out(self):
        print(self.employees)
        
doing = input("What do we want to do?")


Ngoc = FullTime("Ngoc", 18, 5000000, 2)
Huy = PartTime("Huy", 16, 20, 21000)
CN_BinhThanh = Department("Binh_Thanh")
CN_BinhThanh.Hire(Huy)
CN_BinhThanh.Hire(Ngoc)
CN_BinhThanh.List_out()
CN_BinhThanh.Fire(Huy)
CN_BinhThanh.List_out()
