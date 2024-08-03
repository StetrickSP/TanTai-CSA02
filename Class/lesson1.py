###Tạo class Rectangle yêu cầu người dùng nhập vào hai thuộc tính chiều dài, chiều rộng. Class sở hữu hai phương thức tính diện tích và chu vi.
l = int(input("Enter the length of the rectangle: "))
w = int(input("Enter the width of the rectangle: "))
class Rectangle:
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def calcPerimeter(self):
        answer = 2 * (self.length + self.width)
        print(answer)
        return answer
    
    def calcArea(self):
        answer = self.width * self.length 
        print(answer)
        return answer
rec1 = Rectangle(l, w)
rec1.calcPerimeter()
rec1.calcArea()