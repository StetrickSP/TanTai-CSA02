## Bài 1. Hình Chữ Nhật
# class Rectangle:
#     def __init__(self, length, width):
#         self.length = length
#         self.width = width

#     def __str__(self) -> str:
#         return f'Rectangle object with height = {self.length} and width = {self.width}'
# rec1 = Rectangle(2, 1)
# print(rec1)

## Bài 2. MathList
# class MathList:
#     def __init__(self, lst) -> list:
#         self.lst = lst

#     def __str__(self) -> str:
#         return f'{self.lst}'
    
#     def __add__(self, other):
#         for i in range(len(self.lst)):
#             self.lst[i] += other
#         return self.lst
    
#     def __sub__(self, other):
#         for i in range(len(self.lst)):
#             self.lst[i] -= other
#         return self.lst
# list1 = MathList([1, 2, 3, 4, 5])
# print(list1)
# list1 += 1
# print(list1)



## Bài 3. Hình Vuông và Hình Lập Phương
# class Square:
#     def __init__(self, a):
#         self.a = a

#     def calc_area(self):
#         ans = self.a * self.a
#         return ans
    
# class Cube(Square):
#     def __init__(self, a):
#         super().__init__(a)

#     def calc_area(self):
#         ans = 6 * pow(self.a, 2)
#         return ans
    
#     def calc_volume(self):
#         ans = pow(self.a, 3)
#         return ans
    
# square = Square(2)
# print('Square area:', square.calc_area())
# cube = Cube(2)
# print('Cube area:', cube.calc_area())
# print('Cube volume:', cube.calc_volume())



## Bài 4. Tài Khoản
# import datetime

# class User:
#     def __init__(self, name, pw):
#         self.name = name
#         self.pw = pw

#     def welcome(self):
#         print(f'Welcome, {self.name}')
    
#     def check_password(self, dummy) -> str:
#         return True if dummy == self.pw else False

# # user = User('mindx', '12345')
# # user.welcome()
# # print(user.check_password('12345'))

# class SubscribedUser(User):
#     def __init__(self, name, pw, date):
#         super().__init__(name, pw)
#         self.date = date

#     def welcome(self):
#         print(f'Welcome, {self.name}')

#     def check_password(self, dummy) -> str:
#         return True if dummy == self.pw else False
    
#     def is_expired(self):
#         return True if self.date <= datetime.datetime.now() else False
    
# s_user = SubscribedUser('s_mindx', '1234', datetime.datetime(2024, 10, 10))
# s_user.welcome()
# print(s_user.check_password('1234'))
# print(s_user.is_expired())




        

